rbenv::install { 'vagrant':
    group => 'vagrant'
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