use utf8;
package DriverDeets::DB::Schema::Result::Plate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::Plate

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

=head1 TABLE: C<plates>

=cut

__PACKAGE__->table("plates");

=head1 ACCESSORS

=head2 plate_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'plates_plate_id_seq'

=head2 plate

  data_type: 'text'
  is_nullable: 0

=head2 region_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "plate_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "plates_plate_id_seq",
  },
  "plate",
  { data_type => "text", is_nullable => 0 },
  "region_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</plate_id>

=back

=cut

__PACKAGE__->set_primary_key("plate_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<plate_region_uq>

=over 4

=item * L</plate>

=item * L</region_id>

=back

=cut

__PACKAGE__->add_unique_constraint("plate_region_uq", ["plate", "region_id"]);

=head1 RELATIONS

=head2 messages

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Message>

=cut

__PACKAGE__->has_many(
  "messages",
  "DriverDeets::DB::Schema::Result::Message",
  { "foreign.plate_id" => "self.plate_id" },
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

=head2 reviews

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Review>

=cut

__PACKAGE__->has_many(
  "reviews",
  "DriverDeets::DB::Schema::Result::Review",
  { "foreign.plate_id" => "self.plate_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users_plates

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::UsersPlate>

=cut

__PACKAGE__->has_many(
  "users_plates",
  "DriverDeets::DB::Schema::Result::UsersPlate",
  { "foreign.plate_id" => "self.plate_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-10 00:45:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7ZAr1mjuxd5A9suz5SDhsQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
