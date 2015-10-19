package DriverDeets::Controller::Review;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

sub create {
  my $c = shift;
  my $user_id = $c->session('id');
  my $validation = $c->validation;


  if ($c->req->method ne 'POST') {
    if ( !$user_id ) {
      return $c->redirect_to('register');
    }
    my $type = $c->param('type');
    my $state = $c->param('state');
    my $what  = $c->param('what');
    return $c->render(
      template => 'plate/review',
      state => $state,
      type => $type,
      what  => $what,
      error => '',
    );
  }

  $validation->required('rating')->like(qr/^\d\.?\d?/);
  $validation->required('platestate');
  $validation->required('platenum')->size(1, 7);
  $validation->required('wherestate');
  $validation->required('wherecity');
  $validation->required('message')->size(1, 2500);
  my $output = $validation->output;
  $output->{platenum} = uc $output->{platenum};
  $output->{wherecity} = lc $output->{wherecity};


  # We need to get region_id for platestate and wherestate
  my $ps_id = $c->schema->resultset('Region')->find({
    stub => $output->{platestate}
  })->get_column('region_id');

  my $ws_id = $c->schema->resultset('Region')->find({
    stub => $output->{wherestate}
  })->get_column('region_id');

  # Now we get wherecity
  my $wc_id = $c->schema->resultset('City')->find({
    stub => $output->{wherecity},
    region_id => $ws_id
  })->get_column('city_id');

   # Check if this asshole has already reviewed this plate
  my $plate_check_motherfucker = $c->schema->resultset('Review')->find({
    user_id => $user_id,
    'plate.plate' => $output->{platenum},
    'plate.region_id' => $ps_id
  }, { join => [qw/ plate /], } );
  if ( $plate_check_motherfucker ) {
    return $c->render(
      template => 'plate/review',
      error => 'You already reviewed that plate.',
    );
  }

  my $fuck = $c->schema->resultset('Plate')->find({
      plate => $output->{platenum},
      region_id => $ps_id
    });
    $fuck->update({
        review_count => \"review_count + 1",
    }) if $fuck;

  # Now we create the review
  my $plate_rs = $c->schema->resultset('Review')->create({
    body  => $output->{message},
    rating  => $output->{rating},
    city_id => $wc_id,
    user_id => $user_id,
    plate => {
      plate => $output->{platenum},
      region_id => $ps_id
    },
  });

  $c->redirect_to("/plate/us/$output->{platestate}/$output->{platenum}");

}

sub vote {
  my $c = shift;
  my $review = $c->param('review');
  my $what  = $c->param('what');
  my $type = $c->param('type');
  my $user_id = $c->session('id');

  my $vote = $c->schema->resultset('Vote')->find_or_new(
    {
      user_id => $user_id,
      review_id => $review,
      what => $what,
    },
    { key => 'vote_uq' }
  );

  if ( !$vote->in_storage && $type eq 'up' ) {
    $vote->insert;

    my $fuck = $c->schema->resultset('Review')->find({
      review_id => $review
    })->update({
        $what => \"$what + 1",
    });
    return $c->render(text => 'good');
  }
  elsif ( $vote->in_storage && $type eq 'down' ) {
    $vote->delete;

    my $fuck = $c->schema->resultset('Review')->find({
      review_id => $review
    })->update({
        $what => \"$what - 1",
    });
    return $c->render(text => 'good');
  }
  else {
    return $c->render(text => 'failed');
  }
}
1;
