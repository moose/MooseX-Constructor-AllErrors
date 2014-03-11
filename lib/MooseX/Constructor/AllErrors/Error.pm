# vim: ts=4 sts=4 sw=4
package MooseX::Constructor::AllErrors::Error;
# ABSTRACT: base class for individual constructor errors

use Moose;
use namespace::autoclean;

1;
__END__

=pod

=head1 DESCRIPTION

This is the base class for errors held by a
L<MooseX::Constructor::AllErrors::Error::Constructor> object. All error types
support at least this minimal interface.

=head1 METHODS

=head2 message

Returns a human-readable error message for this error.

=head1 SEE ALSO

L<Moose>

=cut
