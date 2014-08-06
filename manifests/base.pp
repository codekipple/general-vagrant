
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

# add ppa's
import 'ppa/init.pp'

# Install latest git
package { "git":
    ensure  => present,
    require => [Exec['ppa-apt-update']]
}


# START apache ------------------------------
class { 'apache':  }

file { '/etc/apache2/mods-enabled/rewrite.load':
    ensure => 'link',
    target => '/etc/apache2/mods-available/rewrite.load',
    notify  => Service['apache2'],
}
# END apache ------------------------------


# START mysql ------------------------------
class { '::mysql::server':
  root_password    => 'password',
}
# END mysql ------------------------------


# START Ruby ------------------------------
rbenv::install { 'vagrant':
    group => 'vagrant'
}
rbenv::compile { '2.1.2':
    user => 'vagrant',
    global => true
}
# END Ruby ------------------------------


# replying on import even though its deprecated because as of yet vagrant does not support pointing to a folder of manifest files. Once it does we can stop using imports to keep code seperated.

import 'sites/*.pp'

import 'node/*.pp'

import 'dotfiles/init.pp'

import 'nfs/init.pp'

file { "/var/www" :
    ensure => directory,
    group => "vagrant",
    owner => "vagrant",
    recurse => true,
}