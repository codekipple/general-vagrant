file { '/home/vagrant/.gitignore':
    ensure  => present,
    owner   => root, group => root,
    source => '/vagrant/manifests/nodes/templates/dotfiles/.gitignore'
}
file { '/home/vagrant/.gitconfig':
    ensure  => present,
    owner   => root, group => root,
    source => '/vagrant/manifests/nodes/templates/dotfiles/.gitconfig'
}
file { '/home/vagrant/.vimrc':
    ensure  => present,
    owner   => root, group => root,
    source => '/vagrant/manifests/nodes/templates/dotfiles/.vimrc'
}