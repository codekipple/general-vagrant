class wp-day-one {
    $folder = "wp-day-one"
    $docroot = "${$folder}/web"
    $domain = "${$folder}.dev.codekipple.com"

    file { "/var/www/${folder}" :
        ensure => directory
    }

    apache::vhost { "${domain}":
        port => "80",
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }

    mysql::db { 'wpdayone_dev':
        user => 'wpdayone_dev',
        password => 'password',
        host => 'localhost'
    }
}

class { 'wp-day-one': }