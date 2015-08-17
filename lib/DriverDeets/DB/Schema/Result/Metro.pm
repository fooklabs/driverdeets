use utf8;
package DriverDeets::DB::Schema::Result::Metro;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::Metro

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

=head1 TABLE: C<metros>

=cut

__PACKAGE__->table("metros");

=head1 ACCESSORS

=head2 metro_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'metros_metro_id_seq'

=head2 metro

  data_type: 'text'
  is_nullable: 0

=head2 stub

  data_type: 'text'
  is_nullable: 0

=head2 region_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "metro_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "metros_metro_id_seq",
  },
  "metro",
  { data_type => "text", is_nullable => 0 },
  "stub",
  { data_type => "text", is_nullable => 0 },
  "region_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</metro_id>

=back

=cut

__PACKAGE__->set_primary_key("metro_id");

=head1 RELATIONS

=head2 cities

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::City>

=cut

__PACKAGE__->has_many(
  "cities",
  "DriverDeets::DB::Schema::Result::City",
  { "foreign.metro_id" => "self.metro_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 region

Type: belongs_to

Related object: L<DriverDeets::DB::Schema::Result::Region>

=cut

__PACKAGE__->belongs_to(
  "region",
  "DriverDeets::DB::Schema::Result::Region",
  { region_id => "region_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-10 00:45:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HB+uFSYpPlfHd6rmhqSs3w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
