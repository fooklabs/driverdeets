package DriverDeets::Controller::User;
use Mojo::Base 'Mojolicious::Controller';

use Email::Valid;
use Data::Dumper;
use SQL::Abstract;

sub login {
  my $c = shift;

  my $login    = $c->param('login');
  my $password = $c->param('password');
  my $from = $c->param('from');

  if ($c->req->method ne 'POST') {
    if ( $c->session('login') and $c->req->headers->referrer !~ /login/ ) {
      return $c->redirect_to($c->req->headers->referrer)
    }
    elsif ( $c->session('login') ) {
      return $c->redirect_to('index')
    }
    else {
      my $url = $c->flash('url') // $c->req->headers->referrer;
      return $c->render(template => 'user/login', url => $url);
    }
  }
  if ( $c->authenticate( $login, $password ) ) {
    return $c->redirect_to($from);
  }

  $c->render(template => 'user/login', error => 'invalid credentials', url => $from);
}

sub register {
  my $c = shift;
  my $validation = $c->validation;

  if ($c->session('login')) {
    return $c->redirect_to('index');
  }
  if ($c->req->method ne 'POST') {
    return $c->render(template => 'user/register', url => $c->req->headers->referrer, error => '');
  }

  $validation->required('register_login')->like(qr/^\w+$/)->size(1, 15);
  $validation->required('repassword')->equal_to('password');
  $validation->required('password')->size(1, 255);
  $validation->optional('email')->size(1, 255);
  $validation->optional('plates')->size(1,10);
  $validation->optional('states');
  $validation->optional('from');
  my $output = $validation->output;
  $output->{register_login} = lc($output->{register_login});
  $output->{email} = lc($output->{email}) if $output->{email};

  my $email = Email::Valid->address($output->{email}) if $output->{email};

  my $error;
  $validation->error(email => ['invalid email']) and $error = 'invalid email'
    if $output->{email} and !$email;

  $validation->error(password => 'passwords do not match') and $error = 'passwords do not match'
    if $output->{password} ne $output->{repassword};

  $validation->error(login => ['not available']) and $error = 'login not available'
    if $c->schema->resultset('User')->find({login => $output->{register_login}});

  return $c->render(
    template => 'user/register',
    error => $error,
    status => 400,
    url => $c->req->headers->referrer
  ) if $validation->has_error;



  my $user = $c->schema->resultset('User')->create({
    login    => $output->{register_login},
    password => $c->bcrypt($output->{password}),
    email    => $output->{email}
  });

  if ( $output->{plates} and $output->{states} ) {
    if ( ref $output->{plates} and ref $output->{states} ) {
      my $index = 0;
      for (@{$output->{plates}}) {
        $index++ and next unless $output->{states}->[$index];

        my $plate = uc $output->{plates}->[$index];
        my $region = $c->schema->resultset('Region')->find({
          region => $output->{states}->[$index]
        });
        $index++ and next unless $region;

        my $plate = $c->schema->resultset('Plate')->create({
          plate => $plate,
          region_id => $region->region_id
        });
        $c->schema->resultset('UsersPlate')->create({
          user_id => $user->user_id,
          plate_id => $plate->plate_id
        });
        $index++;
      }
    }
    else {
      my $region = $c->schema->resultset('Region')->find({
        region => $output->{states}
      });
      my $plate = uc $output->{plates};
      my $plate = $c->schema->resultset('Plate')->create({
        plate => $plate,
        region_id => $region->region_id
      });
      $c->schema->resultset('UsersPlate')->create({
        user_id => $user->user_id,
        plate_id => $plate->plate_id
      });
    }
  }

  if ( $c->authenticate( $user->login, $output->{password} ) ) {
    my $url = $c->flash('url') // $output->{from};
    return $c->redirect_to($url);
  }
  $c->redirect_to('register');
}

sub logout {
  my $c = shift;

  $c->session(login => undef);
  $c->redirect_to('index');
}

sub check_login {
  my $c = shift;
  my $login = $c->param('login');

  my $result = $c->schema->resultset('User')->find({
    login => $login
  });

  if ( $result ) {
    return $c->render(text => 'false');
  }
  else {
    return $c->render(text => 'true');
  }
}

sub view {
  my $c = shift;
  my $user  = lc $c->param('user');


  $c->session( referer => $c->current_route );
  my $review_rs = $c->schema->resultset('Review')->search(
    { 'user.login' => $user },
    { join      => 'user',
      '+select' => ['user.login', 'user.user_id'],
      '+as'     => ['user.login', 'user.user_id'],
      prefetch => [
        { 'city'  => { 'metro' => 'region' } },
        { 'plate' => 'region' },
      ],
    }
  );
  $review_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  $review_rs = [ $review_rs->all ];

  # print Dumper $review_rs;
  $c->render(
    user => $user,
    reviews => $review_rs,
  );
}

sub messages {
  my $c = shift;
  my $user  = $c->session('id');


  my $review_rs = $c->schema->resultset('Review')->search(
    { 'user.user_id' => $user },
    {
      prefetch => [
        { 'city'  => { 'metro' => 'region' } },
        { 'plate' => { 'users_plates' => 'user' } },
      ],
    }
  );
  $review_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  $review_rs = [ $review_rs->all ];

  print Dumper $review_rs;
  my $login = $c->session('login');
  $c->render(
    login => $login,
    reviews => $review_rs,
  );
}

sub settings {
  my $c = shift;
  my $user = $c->session('id');

  my $plate_rs = $c->schema->resultset('Plate')->search(
    { 'users_plates.user_id' => $user },
    {
      prefetch => [
        { 'users_plates' => 'user' },
        { 'region' },
      ],
    },
  );
  $plate_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  $plate_rs = [ $plate_rs->all ];
  $c->render(plates => $plate_rs);
}

1;
