#!/usr/bin/env perl
use strict;
use warnings;
use lib 'lib';
use kenhat;

kenhat->setup_engine('PSGI');
my $app = sub { kenhat->run(@_) };

