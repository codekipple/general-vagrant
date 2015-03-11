class wp-user-profile-theme {
    $folder = "wp-user-profile-theme"
    $docroot = "${folder}/web"
    $domain = "${$folder}.dev.codekipple.com"

    file { "/var/www/${folder}" :
        ensure => directory
    }

    apache::vhost { "${domain}":
        port => "80",
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }

    mysql::db { 'wpuprofile_dev':
        user => 'wpuprofile_dev',
        password => 'password',
        host => 'localhost'
    }
}

class { 'wp-user-profile-theme': }