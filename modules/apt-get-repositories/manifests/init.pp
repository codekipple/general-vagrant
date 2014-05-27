class apt-get-repositories
{
    package { "python-software-properties":
        ensure => present,
        require => [Exec['initial apt-get update']]
    }

    exec { 'git-ppa':
        command => '/usr/bin/add-apt-repository ppa:git-core/ppa -y',
        require => [Package['python-software-properties']],
    }

    exec { "ppa-apt-update":
        command => 'apt-get update',
        require => [Exec['git-ppa']]
    }
}