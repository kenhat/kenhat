package kenhat::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

kenhat::View::TT - TT View for kenhat

=head1 DESCRIPTION

TT View for kenhat.

=head1 SEE ALSO

L<kenhat>

=head1 AUTHOR

kenhat

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
