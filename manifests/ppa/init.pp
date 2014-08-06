# Perform initial apt-get update
exec { 'initial apt-get update':
    command => '/usr/bin/apt-get update'
}
->
package { "python-software-properties":
    ensure => present
}
->
exec { 'git-ppa':
    command => '/usr/bin/add-apt-repository ppa:git-core/ppa -y',
}
->
exec { "ppa-apt-update":
    command => 'apt-get update',
}