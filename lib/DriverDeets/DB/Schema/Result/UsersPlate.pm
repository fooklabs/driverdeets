use utf8;
package DriverDeets::DB::Schema::Result::UsersPlate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::UsersPlate

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

=head1 TABLE: C<users_plates>

=cut

__PACKAGE__->table("users_plates");

=head1 ACCESSORS

=head2 user_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 plate_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "user_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "plate_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<user_plate_uq>

=over 4

=item * L</user_id>

=item * L</plate_id>

=back

=cut

__PACKAGE__->add_unique_constraint("user_plate_uq", ["user_id", "plate_id"]);

=head1 RELATIONS

=head2 plate

Type: belongs_to

Related object: L<DriverDeets::DB::Schema::Result::Plate>

=cut

__PACKAGE__->belongs_to(
  "plate",
  "DriverDeets::DB::Schema::Result::Plate",
  { plate_id => "plate_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user

Type: belongs_to

Related object: L<DriverDeets::DB::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "DriverDeets::DB::Schema::Result::User",
  { user_id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-10 00:45:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rBHkVCCHWfCxqz7iYpQ8Mw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
