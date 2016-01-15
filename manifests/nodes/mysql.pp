class { '::mysql::server':
    root_password => hiera('mysql::password')
}

# file
# {
#     "/etc/mysql/my.cnf":
#         ensure  => present,
#         owner   => root, group => root,
#         notify  => Service['mysql'],
#         source => '/vagrant/manifests/nodes/templates/mysql/my.cnf',
# }