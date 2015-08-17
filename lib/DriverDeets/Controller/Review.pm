package DriverDeets::Controller::Review;
use Mojo::Base 'Mojolicious::Controller';

sub create {
  my $c = shift;

  my $validation = $c->validation;


  if ($c->req->method ne 'POST') {
    return $c->render(template => 'create');
  }

  my $user_id = $c->session('id');
  $validation->required('revtype')->in(qw/positive negative neutral/);
  $validation->required('platestate');
  $validation->required('platenum')->size(1, 7);
  $validation->required('wherestate');
  $validation->required('wherecity');
  $validation->required('message')->size(1, 2500);
  my $output = $validation->output;
  $output->{platenum} = uc $output->{platenum};
  $output->{platenum} =~ s/[^a-z0-9]//gi;
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

  # Now we create the review
  my $plate_rs = $c->schema->resultset('Review')->create({
    body  => $output->{message},
    type  => $output->{revtype},
    city_id => $wc_id,
    user_id => $user_id,
    plate => {
      plate => $output->{platenum},
      region_id => $ps_id
    },
  });

  $c->redirect_to("/us/$output->{platestate}/plate/$output->{platenum}");

}

sub vote {
  my $c = shift;
  my $review = $c->param('review');
  my $what  = $c->param('what');
  my $type = $c->param('type');

  # my $check = $c->schema->resultset('Review_User')->find({
  #   review_id => $review,
  #   user_id => $user,
  # });

  my $do;
  if ( $type eq 'up' ) {
    $do = "$what + 1";
  }
  if ( $type eq 'down' ) {
    $do = "$what - 1";
  }
  # Put in something for up/down, right now only does + 1
  # if ( !$check ) {
  my $fuck = $c->schema->resultset('Review')->find({
    review_id => $review
  })->update({
      $what => \$do,
  });
  $c->render(text => 'good');
}
1;