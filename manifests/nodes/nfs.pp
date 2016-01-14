# enable nfs sharing
package { 'nfs-kernel-server':
    ensure => installed
}

service { 'nfs-kernel-server':
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true
}

# If you want to use nfs to share a directory from the vagrant box out to the host system use this file
# file { '/etc/exports':
#     ensure => present,
#     owner => root, group => root,
#     content => template('/vagrant/manifests/nodes/templates/nfs/exports.erb'),
#     notify => Service['nfs-kernel-server'], # ssh will restart whenever you edit this file.
#     require => Package['nfs-kernel-server']
# }