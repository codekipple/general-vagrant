class { 'nodejs':
    version => 'latest'
}

package { 'grunt-cli':
    ensure   => present,
    provider => 'npm',
    require => Class['nodejs']
}

package { 'bower':
    ensure   => present,
    provider => 'npm',
    require => Class['nodejs']
}