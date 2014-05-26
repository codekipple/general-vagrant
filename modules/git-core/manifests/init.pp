class git-core
{
    package
    {
        "git-core":
            ensure  => latest,
            require => [Exec['git apt update']]
    }

    package
    {
        "python-software-properties":
            ensure => present,
            require => [Exec['initial apt-get update']]
    }

    exec
    {
        'add git apt-repo':
            command => '/usr/bin/add-apt-repository ppa:git-core/ppa -y',
            require => [Package['python-software-properties']],
    }

    exec { "git apt update":
        command => 'apt-get update',
        require => Exec['add git apt-repo']
    }
}