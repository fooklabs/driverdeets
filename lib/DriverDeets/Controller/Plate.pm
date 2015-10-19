package DriverDeets::Controller::Plate;
use Mojo::Base 'Mojolicious::Controller';

use Data::Dumper;

sub view {
  my $c = shift;
  my $country = $c->param('country');
  my $region  = $c->param('region');
  my $plate   = $c->param('plate');
  my $error;

  if ( length $plate < 1 or length $plate > 7 ) {
    $error = 'Sorry, that plate is not valid.';
    return $c->render(template => 'error', error => $error);
  }

  my $review_rs = $c->schema->resultset('Review')->search(
    {
      'region.stub' => $region,
      'plate.plate' => $plate,
    },
    { join      => 'user',
      '+select' => ['user.login', 'user.user_id'],
      '+as'     => ['user.login', 'user.user_id'],
      prefetch => [ { 'plate' => 'region' }, { 'city' => 'region' } ]
    }
  );
  my $similar_plates = $c->schema->resultset('PlateSimilar')->search( { },
    {
      bind => [ $region, $plate, $plate ]
    }
  );

  $similar_plates->result_class('DBIx::Class::ResultClass::HashRefInflator');
  $similar_plates = [ $similar_plates->all ];

  my $review_total = $review_rs->count;
  if ( $review_total > 1 ) {
    $review_total .= ' Reviews';
  }
  elsif ( $review_total == 1 ) {
    $review_total .= ' Review';
  }
  else {
    $review_total = 'No Reviews';
  }
  $review_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  $review_rs = [ $review_rs->all ];
  my $average;
  for ( @{$review_rs} ) {
    $average += $_->{rating};
    my $review_count = $c->schema->resultset('Review')->search({
      user_id => $_->{user}->{user_id}
    })->count;
    $_->{user}->{count} = $review_count;

    if ( my $user_id = $c->session('id') ) {
      my $rs = $c->schema->resultset('Vote')->search({
        user_id => $user_id,
        review_id => $_->{review_id},
      });
      while (my $vote = $rs->next) {
        $_->{vote}->{$vote->what} = 1;
      }
    }
  }
  if ( $review_total > 0 ) {
    $average = $average / $review_total;
  }
  $c->render(
    reviews => $review_rs,
    review_total => $review_total,
    average => $average,
    similar => $similar_plates
  );
}

1;
