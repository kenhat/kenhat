package kenhat;
use Moose;
use namespace::autoclean;
use File::Slurp::Unicode;
use JSON;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
    StackTrace
    Authentication
    Authorization::Roles
    Session
    Session::Store::FastMmap
    Session::State::Cookie
/;
#    Session::Store::File
#    Session::Store::FastMmap

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in kenhat.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'kenhat',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    'Plugin::Session' => {
        cookie_name => 'kenhat_sessionid',
        storage     => '/tmp/kenhat',
    },
    'Plugin::Authentication' => {
        {
            default_realm => 'members',
            members => {
                credential => {
                    class               => 'Password',
                    password_field      => 'password',
                    password_type       => 'hashed',
                    password_hash_type  => 'SHA-1',
                },
                store => {
                    class         => 'DBIx::Class',
                    user_model    => 'DB::User',
                    role_relation => 'role',
                    role_field    => 'role',
                },
            },
        },
    },
);

my $dotcloud = JSON::decode_json(read_file('/home/dotcloud/environment.json'));
foreach my $key (keys %{$dotcloud}) {
    __PACKAGE__->config($key => $dotcloud->{$key});
}

# Start the application
__PACKAGE__->setup();

# DOTCLOUD_WWW_HTTP_HOST->kenhat-kenhat.dotcloud.com
# DOTCLOUD_WWW_SSH_URL->ssh://dotcloud@kenhat-kenhat.dotcloud.com:30353
# DOTCLOUD_DATA_MYSQL_LOGIN->root
# DOTCLOUD_DATA_MYSQL_URL->mysql://root:PPSF4bQ8H6YAiwF7lIdT@kenhat-kenhat.dotcloud.com:30356
# DOTCLOUD_WWW_HTTP_URL->http://kenhat-kenhat.dotcloud.com/
# DOTCLOUD_SERVICE_NAME->www
# DOTCLOUD_DATA_MYSQL_HOST->kenhat-kenhat.dotcloud.com
# DOTCLOUD_SERVICE_ID->0
# DOTCLOUD_DATA_SSH_HOST->kenhat-kenhat.dotcloud.com
# DOTCLOUD_WWW_SSH_PORT->30353
# DOTCLOUD_PROJECT->kenhat
# PORT_HTTP->80
# DOTCLOUD_DATA_MYSQL_PORT->30356
# DOTCLOUD_DATA_SSH_URL->ssh://mysql@kenhat-kenhat.dotcloud.com:30357
# DOTCLOUD_DATA_SSH_PORT->30357
# DOTCLOUD_ENVIRONMENT->default
# DOTCLOUD_WWW_SSH_HOST->kenhat-kenhat.dotcloud.com
# DOTCLOUD_DATA_MYSQL_PASSWORD->PPSF4bQ8H6YAiwF7lIdT
# PORT_SSH->22


1;
