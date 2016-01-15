#General-Vagrant

A vagrant box I use for doing general development.

- OS: Ubuntu precise-server-cloudimg-amd64
- IP: 172.28.128.3
- Git
- Ruby: 2.1.2 (using rbenv)
- apache
- php
- composer
- mysql

## Puppet module dependencies guide
- stdlib -> required by -> [puppetlabs/puppetlabs-apt, puppetlabs/puppetlabs-nodejs, puppetlabs/puppetlabs-mysql]
- apt -> required by -> [puppetlabs/puppetlabs-nodejs]
- puppi -> required by -> [example42/puppet-apache]

## TODO
- Configure apache to use php-fpm

## Changelog

#### 0.1.0


## Instructions

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html)
- *Linux Users:* Install an NFS daemon, e.g. `apt-get install nfs-kernel-server`
- Clone this repo
- Initialise and fetch submodules
    - `git submodule init`
    - `git submodule update --recursive`
- Run `vm_stages=yes vagrant up` from the root of the cloned repo.

On first provision of the vagrant make sure to use the stages environment variable `vm_stages=yes` this is too ensure the puppet stages that update apt-get are run. We don't want to run them on every provision because it's slow but it does need to be run on the first provision.