use utf8;
package kenhat::Schema::DB::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

kenhat::Schema::DB::Result::User

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 userid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 email_address

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 first_name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 last_name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 active

  data_type: 'char'
  is_nullable: 1
  size: 1

=head2 t_updated

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 t_created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "userid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "email_address",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "first_name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "last_name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "active",
  { data_type => "char", is_nullable => 1, size => 1 },
  "t_updated",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "t_created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</userid>

=back

=cut

__PACKAGE__->set_primary_key("userid");

=head1 RELATIONS

=head2 user_roles

Type: has_many

Related object: L<kenhat::Schema::DB::Result::UserRole>

=cut

__PACKAGE__->has_many(
  "user_roles",
  "kenhat::Schema::DB::Result::UserRole",
  { "foreign.userid" => "self.userid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 roleids

Type: many_to_many

Composing rels: L</user_roles> -> roleid

=cut

__PACKAGE__->many_to_many("roleids", "user_roles", "roleid");


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-07-04 19:29:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3aWWQuT2RdEUxMiAAYNeuw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
