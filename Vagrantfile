# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "codekipple/ubuntu-trusty64-latestpuppet"

  if ENV['vm_stages'] == "yes"
    _stages = "yes"
  else
    _stages = "no"
  end

  _bridge = "en1: Wi-Fi (AirPort)"

  # Create a public network
  # environment variables used to alter networking settings
  if ENV['vm_location'] == 'coexist'
    config.vm.network "public_network", bridge: _bridge, ip: "172.16.2.300", netmask: "255.255.240.0"
    config.vm.network "private_network", bridge: _bridge, type: "dhcp"
  elsif ENV['vm_location'] == 'home'
    config.vm.network "public_network", bridge: _bridge, ip: "192.168.2.25"
    config.vm.network "private_network", bridge: _bridge, type: "dhcp"
  else
    config.vm.network "private_network", bridge: _bridge, type: "dhcp"
  end

  # Due to some issues with the ssh keys that arises when a
  # VM becomes disassociated with vagrant we are just using
  # username and password for now even though it's not as secure
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "../", "/var/www", type: "nfs"

  # Provider (VirtualBox, VMWare, ect) configuration
  # Example using VirtualBox:
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "4024"]
    # To add cores
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    #vb.customize ["modifyvm", :id, "--ioapic", "on"]

    # Via http://blog.liip.ch/archive/2012/07/25/vagrant-and-node-js-quick-tip.html
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "base.pp"
    puppet.module_path = "modules"
    puppet.hiera_config_path = 'hiera/hiera.yaml' # path on host machine
    puppet.working_directory = '/vagrant' # Relative path for hiera data directories

    # use facter to pass a hash of variables to puppet set as facter variables
    puppet.facter = {
      "stages" => _stages
    }

    # puppet.options = "--verbose --debug"
  end
end