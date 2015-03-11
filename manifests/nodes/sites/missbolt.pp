class missbolt {
    $folder = "missbolt"
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

    mysql::db { "missbolt_dev":
        user => "missbolt_dev",
        password => 'password',
        host => 'localhost'
    }
}

class { 'missbolt': }