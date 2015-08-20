package DriverDeets::Controller::Plate;
use Mojo::Base 'Mojolicious::Controller';

use Data::Dumper;

sub view {
  my $c = shift;
  my $country = $c->param('country');
  my $region  = $c->param('region');
  my $plate   = $c->param('plate');

  my $review_rs = $c->schema->resultset('Review')->search(
    {
      'region.stub' => $region,
      'plate.plate' => $plate,
    },
    {
      prefetch => [ { 'plate' => 'region' }, { 'city' => 'region' } ]
    }
  );

  $review_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  # $c->render(plate => $plate);
  $c->render(reviews => [ $review_rs->all ]);
}

sub review {
  my $c = shift;

  my $validation = $c->validation;


  if ($c->req->method ne 'POST') {
    return $c->render(template => 'plate/review');
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
1;
