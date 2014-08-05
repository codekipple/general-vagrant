file { '/home/vagrant/.gitignore':
    ensure  => present,
    owner   => root, group => root,
    source => '/vagrant/manifests/dotfiles/files/.gitignore'
}
file { '/home/vagrant/.gitconfig':
    ensure  => present,
    owner   => root, group => root,
    source => '/vagrant/manifests/dotfiles/files/.gitconfig'
}
file { '/home/vagrant/.vimrc':
    ensure  => present,
    owner   => root, group => root,
    source => '/vagrant/manifests/dotfiles/files/.vimrc'
}