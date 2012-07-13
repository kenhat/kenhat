use strict;
use warnings;
use Test::More;


use Catalyst::Test 'kenhat';
use kenhat::Controller::foo;

ok( request('/foo')->is_success, 'Request should succeed' );
done_testing();
