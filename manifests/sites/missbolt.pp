file { "/var/www/missbolt" :
    ensure => directory,
    group => "vagrant",
    owner => "vagrant",
    recurse => false,
}

apache::vhost { 'missbolt.dev.com':
    port    => '80',
    docroot => '/var/www/missbolt/web',
    template => '/vagrant/manifests/sites/missbolt/vhost.erb',
}

mysql::db { 'missbolt_dev':
    user     => 'missbolt_dev',
    password => 'password',
    host     => 'localhost'
}