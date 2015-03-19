class { 'apache':  }

file { '/etc/apache2/mods-enabled/rewrite.load':
    ensure => 'link',
    target => '/etc/apache2/mods-available/rewrite.load',
    notify  => Service['apache2'],
    require => Package['apache2']
}

/*
    See this:
    http://stackoverflow.com/questions/23798498/vagrant-synced-folder-options
*/
user { "www-data":
    ensure => present,
    uid => $::host_uid,
    gid => $::host_gid,
}