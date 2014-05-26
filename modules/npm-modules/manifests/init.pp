class npm-modules
{
    # This function depends on some commands in the nvm class
    define npm( $directory="/home/vagrant/nvm/${node_version}/lib/node_modules" ) {
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

    npm {
        ["bower"]:
    }
}