class www_folder {
    $folder = ""
    $docroot = $folder
    $domain = $folder

    file { "/var/www" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
        recurse => false,
    }

    apache::vhost { 'dev.codekipple.com':
        port    => '80',
        docroot => '/var/www',
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }
}

class { 'www_folder': }