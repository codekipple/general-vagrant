
class init($node_version = "v0.11.13") {
    # Add some default path values
    Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

    exec { "apt-update":
        command => "/usr/bin/apt-get update"
    }

    exec { "add node apt-get repository":
      command => "sudo apt-add-repository -y ppa:chris-lea/node.js",
    }
    exec { "add git apt-get repository":
      command => "add-apt-repository ppa:git-core/ppa",
    }

    Exec["apt-update"] -> Package <| |>

    # Set up git
    include git

    # Set up Ruby
    class { 'ruby':
      gems_version  => 'latest'
    }

    # Base packages and ruby gems (sass, compass)
    class { 'essentials': }

    # Install node through NVM
    class { 'nvm':
        node_version => $node_version,
        require => [Class["essentials"], Class["git"]]
    }

    # Set up MySQL
    class { 'mysql':}

    # This function depends on some commands in the nvm.pp file
    define npm( $directory="/home/vagrant/nvm/${init::node_version}/lib/node_modules" ) {
      exec { "install-${name}-npm-package":
        unless => "test -d ${directory}/${name}",
        command => "npm install -g ${name}",
        require => Exec['install-node'],
      }
    }

    # Global npm modules
    npm {
      ["grunt-cli"]:
    }

    # Make sure our code directory has proper permissions
    file { '/home/vagrant/code':
        ensure => "directory",
        owner  => "vagrant",
        group  => "vagrant"
    }

}