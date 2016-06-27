# http://stackoverflow.com/questions/26595620/how-to-install-ruby-2-1-4-on-ubuntu-14-04

rbenv::install { 'vagrant':
    group => 'vagrant',
    home => '/home/vagrant'
}
rbenv::compile { '2.1.2':
    user => 'vagrant',
    global => true
}
rbenv::gem { 'capistrano':
    user => 'vagrant',
    ruby => '2.1.2'
}
rbenv::gem { 'wpplugin':
    user => 'vagrant',
    ruby => '2.1.2'
}