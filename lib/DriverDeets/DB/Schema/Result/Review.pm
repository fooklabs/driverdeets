use utf8;
package DriverDeets::DB::Schema::Result::Review;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::Review

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

=head1 TABLE: C<reviews>

=cut

__PACKAGE__->table("reviews");

=head1 ACCESSORS

=head2 review_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'reviews_review_id_seq'

=head2 user_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 plate_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 body

  data_type: 'text'
  is_nullable: 0

=head2 rating

  data_type: 'smallint'
  is_nullable: 0

=head2 city_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 viewed

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 anonymous

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 funny

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 useful

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 mean

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 nice

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 created

  data_type: 'timestamp with time zone'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "review_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "reviews_review_id_seq",
  },
  "user_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "plate_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "body",
  { data_type => "text", is_nullable => 0 },
  "rating",
  { data_type => "smallint", is_nullable => 0 },
  "city_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "viewed",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "anonymous",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "funny",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "useful",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "mean",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "nice",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "created",
  {
    data_type     => "timestamp with time zone",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</review_id>

=back

=cut

__PACKAGE__->set_primary_key("review_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<plate_body_uq>

=over 4

=item * L</plate_id>

=item * L</body>

=back

=cut

__PACKAGE__->add_unique_constraint("plate_body_uq", ["plate_id", "body"]);

=head1 RELATIONS

=head2 city

Type: belongs_to

Related object: L<DriverDeets::DB::Schema::Result::City>

=cut

__PACKAGE__->belongs_to(
  "city",
  "DriverDeets::DB::Schema::Result::City",
  { city_id => "city_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

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

=head2 votes

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Vote>

=cut

__PACKAGE__->has_many(
  "votes",
  "DriverDeets::DB::Schema::Result::Vote",
  { "foreign.review_id" => "self.review_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-10 00:45:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PYCUlBIZp6w0Zvp9DsJaGA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
