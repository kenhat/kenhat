package kenhat::Controller::foo;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $foo = $c->session->{'foo'};
    $c->response->body("foo: $foo");
}

sub begin : Private {
    my ( $self, $c ) = @_;
    $c->log->debug('kenhat::Controller::foo::begin');
}

sub default : Path  {
    my ( $self, $c ) = @_;
    $c->log->debug('kenhat::Controller::foo::default');
}

sub end : Path  {
    my ( $self, $c ) = @_;
    $c->log->debug('kenhat::Controller::foo::end');
}

__PACKAGE__->meta->make_immutable;

1;
