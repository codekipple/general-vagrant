class { '::mysql::server':
    root_password => hiera('mysql::password')
}