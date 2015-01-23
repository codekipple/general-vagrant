class wp-user-profile-theme {
    $folder = "wp-user-profile-theme"
    $docroot = "${folder}/web"
    $domain = $docroot

    file { "/var/www/${folder}" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
        recurse => false,
    }

    apache::vhost { "${domain}.dev.codekipple.com":
        port    => "80",
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/sites/templates/vhost.erb",
    }

    mysql::db { 'wpuprofile_dev':
        user     => 'wpuprofile_dev',
        password => 'password',
        host     => 'localhost'
    }
}