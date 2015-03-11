class codekipple {
    $folder = "codekipple.github.io"
    $docroot = "${$folder}"
    $domain = "codekipple.dev.codekipple.com"

    file { "/var/www/${folder}" :
        ensure => directory
    }

    apache::vhost { "${domain}":
        port => "80",
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }
}

class { 'codekipple': }