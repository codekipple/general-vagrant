#General-Vagrant

A vagrant box for doing general development, mostly php and frontend things.

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