# enable nfs sharing
package { 'nfs-kernel-server':
    ensure => installed,
}

file { '/etc/exports':
    ensure  => present,
    owner   => root, group => root,
    source  => '/vagrant/manifests/nfs/files/exports',
    notify  => Service['nfs-kernel-server'], # ssh will restart whenever you edit this file.
    require => Package['nfs-kernel-server'],
}

service { 'nfs-kernel-server':
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
}