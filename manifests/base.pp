
$node_version = "v0.11.13"

file { '/etc/motd':
content => "
  Node Dev VM
    - OS: Ubuntu precise-server-cloudimg-amd64
    - Node: ${node_version}
    - IP: 10.0.0.100
\n"
}

# Add some default path values
Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

# Perform initial apt-get update
exec { 'initial apt-get update':
    command => '/usr/bin/apt-get update'
}

# add ppa's
class { 'apt-get-repositories':}

# Install latest git
package { "git":
    ensure  => latest,
    require => [Exec['ppa-apt-update']]
}

# Install node through NVM
class { 'nvm':
    node_version => $node_version,
    require => [Package["git"]]
}

# Include global npm modules
class { 'npm-modules': }

rbenv::install { 'vagrant':
    group => 'vagrant'
}