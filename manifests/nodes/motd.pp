file { '/etc/motd':
content => "
  General dev VM
    - OS: Ubuntu 12.04
    - IP: ${::ipaddress_eth1}
    - Netmask: ${::netmask_eth1}
    - Git
    - Node
    - Ruby: 2.1.2 (using rbenv)
    - apache
    - php
    - composer
    - mysql
    - Grunt CLI
    - Bower
\n"
}