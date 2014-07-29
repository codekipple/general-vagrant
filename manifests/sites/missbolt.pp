apache::vhost { 'missbolt.dev.com':
    port    => '80',
    docroot => '/var/www/missbolt',
}

mysql::db { 'missbolt_dev':
    user     => 'missbolt_dev',
    password => 'password',
    host     => 'localhost'
}