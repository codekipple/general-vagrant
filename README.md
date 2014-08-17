#General-Vagrant

A vagrant box i use for doing general development.

- OS: Ubuntu precise-server-cloudimg-amd64
- IP: 10.0.0.100
- Git
- Node
- Ruby: 2.1.2 (using rbenv)
- apache
- php
- composer
- mysql
- Grunt CLI
- Bower


## TODO
- Configure apache to use php-fpm
- Decide how to make use of the shared folder (node task managers are slow on folders shared from the client into the VM)

## Changelog

#### 0.1.0


## Instructions

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html)
- *Linux Users:* Install an NFS daemon, e.g. `apt-get install nfs-kernel-server`
- Clone this repo
- Initialise and fetch submodules
    - `git submodule init`
    - `git submodule update --recursive`
- Run `vagrant up` from the root of the cloned repo.