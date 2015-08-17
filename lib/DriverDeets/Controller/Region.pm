package DriverDeets::Controller::Region;
use Mojo::Base 'Mojolicious::Controller';

use Data::Dumper;

sub list {
  my $c = shift;
  my $country  = $c->param('country');
  my $region   = $c->param('region');
  my $type     = $c->param('type');
  my $name     = $c->param('name');
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
  my $link = "/us/$region";
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

  if (
    $f ne 'funny' and
    $f ne 'mean' and
    $f ne 'nice' and
    $f ne 'useful' and
    $f ne 'shame' and
    $f ne 'fame' ) {
    $f = 'created';
  }

  my $review_rs = $c->schema->resultset('Review')->search(
    $where,
    {
      prefetch => [
        { 'city'  => { 'metro' => 'region' } },
        { 'plate' => 'region' },
      ],
      order_by => { -desc => $f }
    }
  );

  $review_rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
  $c->render(
    metros => $region_rs->all,
    reviews => [ $review_rs->all ],
    link => $link,
    location => $location,
    type => $type,
    name => $name
  );
  # $c->render(json => [ $review_rs->all ]);
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