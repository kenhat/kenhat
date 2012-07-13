use utf8;
package kenhat::Schema::DB::Result::UserRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

kenhat::Schema::DB::Result::UserRole

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

=head1 TABLE: C<user_role>

=cut

__PACKAGE__->table("user_role");

=head1 ACCESSORS

=head2 userid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 roleid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "userid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "roleid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</userid>

=item * L</roleid>

=back

=cut

__PACKAGE__->set_primary_key("userid", "roleid");

=head1 RELATIONS

=head2 roleid

Type: belongs_to

Related object: L<kenhat::Schema::DB::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "roleid",
  "kenhat::Schema::DB::Result::Role",
  { roleid => "roleid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 userid

Type: belongs_to

Related object: L<kenhat::Schema::DB::Result::User>

=cut

__PACKAGE__->belongs_to(
  "userid",
  "kenhat::Schema::DB::Result::User",
  { userid => "userid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-07-04 19:29:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3fZ5XNArT6nwFSWwWseusQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
