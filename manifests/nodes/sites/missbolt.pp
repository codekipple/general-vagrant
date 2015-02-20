class missbolt {
    $folder = "missbolt"
    $docroot = "${$folder}/web"
    $domain = $folder

    file { "/var/www/${folder}" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
        recurse => false,
    }

    apache::vhost { "${domain}.dev.codekipple.com":
        port    => '80',
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }

    mysql::db { "${domain}_dev":
        user     => "${domain}_dev",
        password => 'password',
        host     => 'localhost'
    }
}

class { 'missbolt': }