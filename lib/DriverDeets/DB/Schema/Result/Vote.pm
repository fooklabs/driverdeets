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

=head2 what

  data_type: 'text'
  is_nullable: 0

=head2 vote_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'votes_vote_id_seq'

=cut

__PACKAGE__->add_columns(
  "user_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "review_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "what",
  { data_type => "text", is_nullable => 0 },
  "vote_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "votes_vote_id_seq",
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</vote_id>

=back

=cut

__PACKAGE__->set_primary_key("vote_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<vote_uq>

=over 4

=item * L</user_id>

=item * L</review_id>

=item * L</what>

=back

=cut

__PACKAGE__->add_unique_constraint("vote_uq", ["user_id", "review_id", "what"]);

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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-10-16 03:05:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lviYsjzKjWaNXC54fPpPKw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
