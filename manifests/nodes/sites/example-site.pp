class sitename {
    $folder = "sitename"
    $docroot = "${$folder}"
    $domain = "sitename.dev.com"

    file { "/var/www/${folder}" :
        ensure => directory
    }

    apache::vhost { "${domain}":
        port => "80",
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }
}

class { 'sitename': }