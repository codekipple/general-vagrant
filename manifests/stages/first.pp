/*
    The first stage is used to make sure the necessary
    PPA's and packages are present to ensure latest versions
    of the packages we require in the main stage
*/

class first_stage {

    apt::ppa { 'ppa:git-core/ppa':}

    apt::ppa { 'ppa:chris-lea/node.js':}

    apt::ppa { 'ppa:ondrej/php5 -y':
        require => Package['software-properties-common']
    }

}