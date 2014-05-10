class mysql {
  class { '::mysql::server':
    root_password => 'secret'
  }

  include '::mysql::server'

}
