class codekipple {
    $folder = "codekipple.github.io"
    $docroot = "${$folder}"
    $domain = "codekipple"

    file { "/var/www/${folder}" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
        recurse => false,
    }

    apache::vhost { '${domain}.dev.codekipple.com':
        port    => '80',
        docroot => '/var/www/${folder}',
        template => "/vagrant/manifests/sites/templates/vhost.erb"
    }
}