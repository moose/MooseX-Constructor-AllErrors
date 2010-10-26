use strict;
use warnings;
use Test::More tests => 4;

{
    use Moose::Util::TypeConstraints;

    subtype 'PositiveInt', as   'Int', where { $_ >= 0 };
    coerce  'PositiveInt', from 'Int', via   { abs     };

    no Moose::Util::TypeConstraints;
}

{
    package Foo;
    use Moose;

    has int => (
        is     => 'ro',
        isa    => 'PositiveInt',
        coerce => 1,
    );
}

{
    package Bar;
    use Moose;
    use MooseX::Constructor::AllErrors;

    has int => (
        is     => 'ro',
        isa    => 'PositiveInt',
        coerce => 1,
    );
}

{
    my $foo = Foo->new(int => -3);
    my $bar = Bar->new(int => -3);
    is($foo->int, 3, 'coercion happens properly');
    is($bar->int, 3, 'coercion happens properly with mx-constructor-allerrors');
    if (Foo->meta->is_mutable) {
        Foo->meta->make_immutable;
        Bar->meta->make_immutable;
        redo;
    }
}
