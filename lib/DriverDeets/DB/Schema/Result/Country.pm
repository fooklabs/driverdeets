use utf8;
package DriverDeets::DB::Schema::Result::Country;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::Country

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

=head1 TABLE: C<countries>

=cut

__PACKAGE__->table("countries");

=head1 ACCESSORS

=head2 country_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'countries_country_id_seq'

=head2 country

  data_type: 'text'
  is_nullable: 0

=head2 stub

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "country_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "countries_country_id_seq",
  },
  "country",
  { data_type => "text", is_nullable => 0 },
  "stub",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</country_id>

=back

=cut

__PACKAGE__->set_primary_key("country_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<country_uq>

=over 4

=item * L</country>

=back

=cut

__PACKAGE__->add_unique_constraint("country_uq", ["country"]);

=head2 C<stub_uq>

=over 4

=item * L</stub>

=back

=cut

__PACKAGE__->add_unique_constraint("stub_uq", ["stub"]);

=head1 RELATIONS

=head2 regions

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Region>

=cut

__PACKAGE__->has_many(
  "regions",
  "DriverDeets::DB::Schema::Result::Region",
  { "foreign.country_id" => "self.country_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-10 00:45:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ckm7KBkEYVrC8WrvDVmHlg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
