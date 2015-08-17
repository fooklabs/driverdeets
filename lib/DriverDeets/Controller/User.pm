package DriverDeets::Controller::User;
use Mojo::Base 'Mojolicious::Controller';

use Email::Valid;
use Data::Dumper;
use SQL::Abstract;

sub login {
  my $c = shift;

  my $login    = $c->param('login');
  my $password = $c->param('password');

  if ($c->session('login')) {
    return $c->redirect_to('index');
  }
  if ($c->req->method ne 'POST') {
    return $c->render(template => 'user/login');
  }
  if ( $c->authenticate( $login, $password ) ) {
    $c->redirect_to('index');
  }

  $c->render(template => 'user/login', error => 'invalid credentials');
}

sub register {
  my $c = shift;
  my $validation = $c->validation;

  if ($c->session('login')) {
    return $c->redirect_to('index');
  }
  if ($c->req->method ne 'POST') {
    return $c->render(template => 'user/register');
  }

  $validation->required('login')->like(qr/^\w+$/)->size(1, 15);
  $validation->required('repassword')->equal_to('password');
  $validation->required('password')->size(1, 255);
  $validation->optional('email')->size(1, 255);
  $validation->optional('plates')->size(1,10);
  $validation->optional('states');
  my $output = $validation->output;
  print Dumper $output;
  $output->{login} = lc($output->{login});
  $output->{email} = lc($output->{email}) if $output->{email};

  my $email = Email::Valid->address($output->{email}) if $output->{email};

  $validation->error(email => ['invalid email'])
    if $output->{email} and !$email;

  $validation->error(password => 'passwords do not match')
    if $output->{password} ne $output->{repassword};

  $validation->error(login => ['not available'])
    if $c->schema->resultset('User')->find({login => $output->{login}});

  return $c->render(
    template => 'user/register',
    error => $validation,
    status => 400
  ) if $validation->has_error;



  my $user = $c->schema->resultset('User')->create({
    login    => $output->{login},
    password => $c->bcrypt($output->{password}),
    email    => $output->{email}
  });

  if ( $output->{plates} and $output->{states} ) {
    if ( ref $output->{plates} and ref $output->{states} ) {
      my $index = 0;
      for (@{$output->{plates}}) {
        $index++ and next unless $output->{states}->[$index];

        my $region = $c->schema->resultset('Region')->find({
          region => $output->{states}->[$index]
        });
        $index++ and next unless $region;

        my $plate = $c->schema->resultset('Plate')->create({
          plate => $output->{plates}->[$index],
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

      my $plate = $c->schema->resultset('Plate')->create({
        plate => $output->{plates},
        region_id => $region->region_id
      });
      $c->schema->resultset('UsersPlate')->create({
        user_id => $user->user_id,
        plate_id => $plate->plate_id
      });
    }
  }

  if ( $c->authenticate( $user->login, $output->{password} ) ) {
    return $c->redirect_to('index');
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
  my $db = $c->pg->db;
  my $login = $c->param('reglogin');

  my $result = $db->query(
    '
      select login from "user" where login = ?
    ',$login,
  )->hash;

  if ( $result->{login} ) {
    return $c->render(text => '<span class="smallest color" id="user-result">username not available</span>');
  }
  else {
    return $c->render(text => '<span class="smallest success" id="user-result">username is available</span>');
  }
}
# sub view {
#   my $c = shift;
#   my $db = $c->pg->db;

#   my $login = $c->param('login');
#   if ( $c->session('login') eq $login ) {

#     # Grab their posts
#     my $posts = $db->query('
#       select
#         post_uuid,
#         title,
#         slug,
#         upvotes,
#         array_agg(post_to_topic.topic) AS topics
#       from post
#       left join post_to_topic on post.post_id=post_to_topic.post
#       where login = ?
#       GROUP BY post.post_id
#       order by created desc limit 20
#     ');

#     # Grab subscribed topics

#     # Grab liked posts

#   }
#   my $posts = $db->query(
#     'select a.post_uuid,a.title,a.created,b.topic from post a
#      join post_to_topic b on a.post_id=b.post_id
#      where login = ? and public and published order by created',
#     $login
#   )->hash;
#     my $links = $db->query(
#       'select a.link_uuid,a.title,a.url,a.created,b.topic from link a
#        join link_to_topic b on a.link_id=b.link_id
#        where login = ? order by created',
#       $login
#     )->hash;
#     my $books = $db->query(
#       'select book_uuid,name,created from book
#       where login = ? and public',
#       $login
#     );
#     $c->render(posts => $posts, links => $links, books => $books);
#   } catch {
#     #$c->render(error)
#   }
# }

1;
