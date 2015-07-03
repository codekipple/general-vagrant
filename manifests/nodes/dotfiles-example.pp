/*
Rename this file to dotfiles.pp, the dotfiles.pp will be ignored by git
Unfortunately globbing a directory of files in puppet is sooooooo slow.

I recommend just linking to each file individualy.
*/

# file { '/home/vagrant/.gitignore':
#     ensure  => present,
#     owner   => root, group => root,
#     source => '/vagrant/manifests/nodes/templates/dotfiles/.gitignore'
# }
# file { '/home/vagrant/.gitconfig':
#     ensure  => present,
#     owner   => root, group => root,
#     source => '/vagrant/manifests/nodes/templates/dotfiles/.gitconfig'
# }
# file { '/home/vagrant/.vimrc':
#     ensure  => present,
#     owner   => root, group => root,
#     source => '/vagrant/manifests/nodes/templates/dotfiles/.vimrc'
# }