# Take from openbadges setup.

class essentials {
  group { "puppet" :
    ensure => present,
    name => "puppet";
  }

  Package { ensure => installed }

  package {
    ["curl",
    "libssl-dev",
    "build-essential"
    ]:
  }

  # Ruby modules for general development
  # package {
  #   ["jekyll"]:
  #     provider => "gem"
  # }

  file { "/home/vagrant/software":
    ensure => "directory",
  }

  #file { "/usr/local":
  #  recurse => true,
  #  group => "vagrant",
  #  owner => "vagrant";
  #}
}