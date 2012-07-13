#!/usr/bin/env perl

use Modern::Perl;
use Module::Extract::Use;

my $extor = Module::Extract::Use->new;

my $file = 'script/kenhat.psgi';
my @modules = $extor->get_modules( $file );
if( $extor->error ) { say "Got error!" }

foreach my $mod (@modules) {
    say "M -> $mod"
}



