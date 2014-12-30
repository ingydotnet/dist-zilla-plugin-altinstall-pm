package Dist::Zilla::Plugin::AltInstall;
our $VERSION = '0.01';

use Moose;
extends 'Dist::Zilla::Plugin::MakeMaker::Awesome';
with qw(Dist::Zilla::Role::AfterBuild Dist::Zilla::Role::FileGatherer);

around _build_header => sub {
    my $orig = shift;
    my $self = shift;
    return $self->$orig(@_) . <<'...';

# O HAI
my $alt = $ENV{PERL_ALT_INSTALL} || '';

...
};

around _build_WriteMakefile_args => sub {
    my $orig = shift;
    my $self = shift;

    my $make_args = $self->$orig(@_);

    return $make_args;
};

sub after_build {
    my ($self, $hash) = @_;
}

1;
