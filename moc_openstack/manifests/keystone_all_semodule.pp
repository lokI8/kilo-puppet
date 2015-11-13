class moc_openstack::keystone_all_semodule {
  file { 'keystone_all_semodule':
    ensure => 'file',
    source => 'puppet:///modules/mymodule/keystone_all_semodule.sh',
    path => '/usr/local/bin/keystone_all_semodule.sh',
    owner => 'root'
    group => 'root'
    mode  => '0744',
    notify => Exec['run_keystone_all_semodule'],
  }
  exec { 'run_keystone_all_semodule':
    command => '/usr/local/bin/keystone_all_semodule.sh',
    refreshonly => true,
  }
}
