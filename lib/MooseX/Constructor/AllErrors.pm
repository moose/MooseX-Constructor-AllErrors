package MooseX::Constructor::AllErrors;
# ABSTRACT: Capture all constructor errors

use Moose ();
use Moose::Exporter;

use MooseX::Constructor::AllErrors::Error;
use MooseX::Constructor::AllErrors::Error::Constructor;
use MooseX::Constructor::AllErrors::Error::Required;
use MooseX::Constructor::AllErrors::Error::TypeConstraint;
use MooseX::Constructor::AllErrors::Error::Misc;

Moose::Exporter->setup_import_methods(
    base_class_roles => [ 'MooseX::Constructor::AllErrors::Role::Object' ],
);

1;

__END__

=pod

=head1 SYNOPSIS

  package MyClass;
  use MooseX::Constructor::AllErrors;

  has foo => (is => 'ro', required => 1);
  has bar => (is => 'ro', isa => 'Int');

  ...

  eval { MyClass->new(bar => "hello") };
  # $@->errors has two errors, not just the missing required attribute

=head1 DESCRIPTION

MooseX::Constructor::AllErrors tries to capture every error generated during
the construction of your objects, rather than halting after the first.

If there are errors, C<$@> will contain a
L<MooseX::Constructor::AllErrors::Error::Constructor> object.  See its
documentation for possible error types.

=head1 SEE ALSO

L<Moose>

=cut
