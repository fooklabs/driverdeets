use utf8;
package DriverDeets::DB::Schema::Result::Region;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::Region

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<regions>

=cut

__PACKAGE__->table("regions");

=head1 ACCESSORS

=head2 region_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'regions_region_id_seq'

=head2 region

  data_type: 'text'
  is_nullable: 0

=head2 stub

  data_type: 'text'
  is_nullable: 0

=head2 country_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 abbr

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "region_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "regions_region_id_seq",
  },
  "region",
  { data_type => "text", is_nullable => 0 },
  "stub",
  { data_type => "text", is_nullable => 0 },
  "country_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "abbr",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</region_id>

=back

=cut

__PACKAGE__->set_primary_key("region_id");

=head1 RELATIONS

=head2 cities

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::City>

=cut

__PACKAGE__->has_many(
  "cities",
  "DriverDeets::DB::Schema::Result::City",
  { "foreign.region_id" => "self.region_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 country

Type: belongs_to

Related object: L<DriverDeets::DB::Schema::Result::Country>

=cut

__PACKAGE__->belongs_to(
  "country",
  "DriverDeets::DB::Schema::Result::Country",
  { country_id => "country_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 metros

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Metro>

=cut

__PACKAGE__->has_many(
  "metros",
  "DriverDeets::DB::Schema::Result::Metro",
  { "foreign.region_id" => "self.region_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 plates

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Plate>

=cut

__PACKAGE__->has_many(
  "plates",
  "DriverDeets::DB::Schema::Result::Plate",
  { "foreign.region_id" => "self.region_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-10 00:45:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cT9VG1TCWBxslq9uFFgeWQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
