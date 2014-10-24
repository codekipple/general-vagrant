apache::vhost { 'vagrant.dev.com':
    port    => '80',
    docroot => '/var/www/',
    template => '/vagrant/manifests/sites/vagrant/vhost.erb',
}