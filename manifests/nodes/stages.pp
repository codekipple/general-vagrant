/*
    The first stage is used to make sure the necessary
    PPA's and packages are present to ensure latest versions
    of the packages we require in the main stage
*/
class first_stage {

    apt::ppa { 'ppa:git-core/ppa':}

    # TODO: change PPA
    # https://nodesource.com/blog/chris-lea-joins-forces-with-nodesource
    # https://deb.nodesource.com/setup
    apt::ppa { 'ppa:chris-lea/node.js':}

    apt::ppa { 'ppa:ondrej/php5 -y':
        require => Package['software-properties-common']
    }

}

/*
    The second stage just ensures a apt-get update has
    happened after any PPA's have been added.
*/
class second_stage {

    exec { "final-apt-update":
        command => "sudo /usr/bin/apt-get update"
    }

    include stdlib

}

/*
    Using stages to make sure apt is up to date before
    we start installing packages in the main stage
*/
if ($stages == "yes") {
    stage { 'first': }
    stage { 'second': }

    Stage['first'] -> Stage['second'] -> Stage['main']

    class { 'first_stage':
        stage => first
    }

    class { 'second_stage':
        stage => second
    }

    class { 'apt':
        always_apt_update => false,
        stage => first
    }
}