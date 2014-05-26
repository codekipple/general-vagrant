
$node_version = "v0.11.13"

file { '/etc/motd':
	content => "
      .-----.
    .' -   - '.       Ghost Dev VM
   /  .-. .-.  \\      - Version: 1.2 (Casper)
   |  | | | |  |
    \\ \\o/ \\o/ /       - OS:      Ubuntu precise-server-cloudimg-amd64
   _/    ^    \\_      - Node:    ${node_version}
  | \\  '---'  / |     - IP:      10.0.0.100
  / /`--. .--`\\ \\     - Code:    ~/code/Ghost
 / /'---` `---'\\ \\
 '.__.       .__.'
     `|     |`
      |     \\
      \\      '--.
       '.        `\\
         `'---.   |
            ,__) /
             `..'
\n"
}

# Add some default path values
Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

exec
{
    'initial apt-get update':
        command => '/usr/bin/apt-get update'
}

include git-core
