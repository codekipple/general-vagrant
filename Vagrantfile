# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "base"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "vagrant.example.com"

  # Create a public network, the ip needs to be different depending on the network we're on
  # pass environment variables to alter the ip

  if ENV['LOCATION'] == 'coexist'
    _ip = "10.0.0.111" # 10.0.0.0/8
  elseif ENV['LOCATION'] == 'other'
    _ip = "172.16.0.111" # 172.16.0.0/12
  else
    _ip = "192.168.2.25" # 192.168.0.0/16
  end

  config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)", ip: _ip

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../", "/var/www/code", type: "nfs"

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

    # use facter to pass a hash of variables to puppet set as facter variables
    puppet.facter = {
      "ip" => _ip
    }

    # puppet.options = "--verbose --debug"
  end
end
