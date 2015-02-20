class wp-day-one {
    $folder = "wp-day-one"
    $docroot = "${$folder}/web"
    $domain = $folder

    file { "/var/www/${folder}" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
        recurse => false,
    }

    apache::vhost { "${domain}.dev.codekipple.com":
        port    => "80",
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb",
    }

    mysql::db { 'wpdayone_dev':
        user     => 'wpdayone_dev',
        password => 'password',
        host     => 'localhost'
    }
}

class { 'wp-day-one': }