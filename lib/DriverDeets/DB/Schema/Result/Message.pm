use utf8;
package DriverDeets::DB::Schema::Result::Message;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::Message

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

=head1 TABLE: C<messages>

=cut

__PACKAGE__->table("messages");

=head1 ACCESSORS

=head2 message_id

  data_type: 'bigint'
  is_nullable: 0

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

=head2 viewed

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 created

  data_type: 'timestamp with time zone'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "message_id",
  { data_type => "bigint", is_nullable => 0 },
  "user_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "plate_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "body",
  { data_type => "text", is_nullable => 0 },
  "viewed",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
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

=item * L</message_id>

=back

=cut

__PACKAGE__->set_primary_key("message_id");

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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-10 00:45:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:shBjamUgYatYF3gzsKsXkA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
