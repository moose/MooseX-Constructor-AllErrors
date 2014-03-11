package MooseX::Constructor::AllErrors::Error::Required;
# ABSTRACT: represents a missing argument error

use Moose;
extends 'MooseX::Constructor::AllErrors::Error';
use namespace::autoclean;

has attribute => (
    is => 'ro',
    isa => 'Moose::Meta::Attribute',
    required => 1,
);

sub message {
    my $self = shift;
    return sprintf 'Attribute (%s) is required',
        $self->attribute->name;
}

1;
__END__

=pod

=head1 DESCRIPTION

This class represents a required constructor argument not being passed in.

=head1 METHODS

=head2 message

Returns a human-readable error message for this error.

=head2 attribute

The L<Moose::Meta::Attribute> object that this error relates to.

=head1 SEE ALSO

L<Moose>

=cut
