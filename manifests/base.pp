
file { '/etc/motd':
content => "
  Node Dev VM
    - OS: Ubuntu precise-server-cloudimg-amd64
    - IP: 10.0.0.100
    - Git: latest stable version for this OS
    - Node: v0.11.13
    - Ruby: 2.1.2 (using rbenv)
    - apache
    - mysql
    - Grunt CLI: latest
    - Bower: latest
\n"
}

# Add some default path values
Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/v0.11.13/bin"], }

# Perform initial apt-get update
exec { 'initial apt-get update':
    command => '/usr/bin/apt-get update'
}

# add ppa's
class { 'apt-get-repositories':}

# Install latest git
package { "git":
    ensure  => present,
    require => [Exec['ppa-apt-update']]
}

class { 'apache':  }

class { '::mysql::server':
  root_password    => 'password',
}

# Install rbenv and use it to configure ruby
rbenv::install { 'vagrant':
    group => 'vagrant'
}
rbenv::compile { '2.1.2':
    user => 'vagrant',
    global => true
}

# replying on import even though its deprecated because as of yet vagrant does not support pointing to a folder of manifest files. Once it does we can stop using imports to keep code seperated.

import 'sites/*.pp'

import 'node/*.pp'

import 'dotfiles/init.pp'

import 'nfs/init.pp'