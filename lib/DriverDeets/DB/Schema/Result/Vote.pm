use utf8;
package DriverDeets::DB::Schema::Result::Vote;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::Vote

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

=head1 TABLE: C<votes>

=cut

__PACKAGE__->table("votes");

=head1 ACCESSORS

=head2 user_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 review_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 type

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "user_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "review_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "type",
  { data_type => "text", is_nullable => 0 },
);

=head1 RELATIONS

=head2 review

Type: belongs_to

Related object: L<DriverDeets::DB::Schema::Result::Review>

=cut

__PACKAGE__->belongs_to(
  "review",
  "DriverDeets::DB::Schema::Result::Review",
  { review_id => "review_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dh4RJpS+snJ3a24T3XYNmg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
