use strict;
use warnings;

use kenhat;

my $app = kenhat->apply_default_middlewares(kenhat->psgi_app);
$app;

