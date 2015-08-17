use utf8;
package DriverDeets::DB::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DriverDeets::DB::Schema::Result::User

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

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 user_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'users_user_id_seq'

=head2 email

  data_type: 'text'
  is_nullable: 1

=head2 password

  data_type: 'text'
  is_nullable: 0

=head2 login

  data_type: 'text'
  is_nullable: 0

=head2 reset_code

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "user_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "users_user_id_seq",
  },
  "email",
  { data_type => "text", is_nullable => 1 },
  "password",
  { data_type => "text", is_nullable => 0 },
  "login",
  { data_type => "text", is_nullable => 0 },
  "reset_code",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</user_id>

=back

=cut

__PACKAGE__->set_primary_key("user_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<login_uq>

=over 4

=item * L</login>

=back

=cut

__PACKAGE__->add_unique_constraint("login_uq", ["login"]);

=head1 RELATIONS

=head2 messages

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Message>

=cut

__PACKAGE__->has_many(
  "messages",
  "DriverDeets::DB::Schema::Result::Message",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reviews

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Review>

=cut

__PACKAGE__->has_many(
  "reviews",
  "DriverDeets::DB::Schema::Result::Review",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users_plates

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::UsersPlate>

=cut

__PACKAGE__->has_many(
  "users_plates",
  "DriverDeets::DB::Schema::Result::UsersPlate",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 votes

Type: has_many

Related object: L<DriverDeets::DB::Schema::Result::Vote>

=cut

__PACKAGE__->has_many(
  "votes",
  "DriverDeets::DB::Schema::Result::Vote",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-10 00:45:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KPDE3CeL4SNwHz47CNKcog


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
