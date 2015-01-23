class www_folder {
    $folder = ""
    $docroot = $folder
    $domain = $folder

    apache::vhost { 'dev.codekipple.com':
        port    => '80',
        docroot => '/var/www/$',
        template => "/vagrant/manifests/sites/templates/vhost.erb"
    }
}