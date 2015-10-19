package DriverDeets::Controller::Region;
use Mojo::Base 'Mojolicious::Controller';

use Data::Dumper;

sub list {
  my $c = shift;
  my $country  = lc $c->param('country');
  my $region   = lc $c->param('region');
  my $type     = lc $c->param('type');
  my $name     = lc $c->param('name');
  my $f        = $c->param('f') // '';
  my $t        = $c->param('t') // '';

  my $region_rs = $c->schema->resultset('Region')->search(
    {
      'me.stub' => $region,
    },
    {
      prefetch   => [ qw/metros cities/ ],
    }
  );
  $region_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');

  my $where = {
    'region.stub' => $region,
    'me.created' => { '>=' => \'current_date - interval \'1 week\'' }
  };
  my $link = "/list/us/$region";
  my $location = $region;
  if ( $type eq 'metro' ) {
    $where->{'metro.stub'} = $name;
    $link .= "/metro/$name";
    $location = $name;
  }
  if ( $type eq 'city' ) {
    $where->{'city.stub'}  = $name;
    $link .= "/city/$name";
    $location = $name;
  }

  if ( $t eq 'week' or $t eq 'month' or $t eq 'year' or $t eq 'day' ) {
    $where->{'me.created'}->{'>='} = \"current_date - interval '1 $t'";
  }
  elsif ( $t = 'all' ) {
    delete $where->{'me.created'}
  }

  my $order_by;
  if (
    $f ne 'funny' and
    $f ne 'mean' and
    $f ne 'nice' and
    $f ne 'useful' and
    $f ne 'shame' and
    $f ne 'fame' ) {
    $f = 'created';
  }
  if ( $f eq 'shame' ) {
    push @{$order_by->{'-asc'}}, 'plate.review_count';
    push @{$order_by->{'-asc'}}, 'rating';
  }
  elsif ( $f eq 'fame' ) {
    push @{$order_by->{'-desc'}}, 'plate.review_count';
    push @{$order_by->{'-desc'}}, 'rating';
  }
  else {
    push @{$order_by->{'-desc'}}, $f;
  }
  my $review_rs = $c->schema->resultset('Review')->search(
    $where,
    {
      join      => 'user',
      '+select' => ['user.login', 'user.user_id'],
      '+as'     => ['user.login', 'user.user_id'],
      prefetch => [
        { 'city'  => { 'metro' => 'region' } },
        { 'plate' => 'region' },
      ],
      order_by => $order_by,
    }
  );
  $review_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  $review_rs = [ $review_rs->all ];

  for ( @{$review_rs} ) {
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
  print Dumper $review_rs;
  $c->render(
    metros => $region_rs->all,
    reviews => $review_rs,
    link => $link,
    location => $location,
    type => $type,
    name => $name
  );
}

sub cities {
  my $c = shift;
  my $region = $c->param('region');

  my $city_rs = $c->schema->resultset('City')->search({
    'region.stub' => $region,

  }, {
    join      => 'region',
    select => ['me.city', 'me.stub'],
    as     => ['name','stub'],
    order_by  => ['me.city'],
  });
  $city_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  $c->render(json => [ $city_rs->all ]);
}
1;
