
class init($node_version = "v0.10.26") {
    # Add some default path values
    Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

    exec { "apt-update":
        command => "/usr/bin/apt-get update"
    }

    Exec["apt-update"] -> Package <| |>

    # Set up git
    include git

    # Base packages and ruby gems (sass, compass)
    class { essentials: }

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
