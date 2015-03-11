class www_folder {
    $folder = ""
    $docroot = ""
    $domain = "dev.codekipple.com"

    file { "/var/www" :
        ensure => directory
    }

    apache::vhost { 'dev.codekipple.com':
        port    => '80',
        docroot => '/var/www',
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }
}

class { 'www_folder': }