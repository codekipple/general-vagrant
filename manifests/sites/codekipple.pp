file { "/var/www/codekipple.github.io" :
    ensure => directory,
    group => "vagrant",
    owner => "vagrant",
    recurse => false,
}

apache::vhost { 'codekipple.dev.codekipple.com':
    port    => '80',
    docroot => '/var/www/codekipple.github.io',
    template => '/vagrant/manifests/sites/codekipple/vhost.erb',
}