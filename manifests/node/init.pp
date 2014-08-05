# Install node through NVM
class { 'nvm':
    node_version => "v0.11.13",
    require => [Package["git"]]
}