# This module does the initial fernet key set-up
class moc_openstack::generate_fernet_keys {
  # Creates the directory if it does not exist
  file { 'create_fernet_directory':
    ensure => 'directory',
    path  => '/etc/keystone/fernet-keys', 
    owner => 'keystone',
    group => 'keystone',
    mode  => '0744',
  }

  # If the directory is empty, runs fernet key generation
  exec { 'generate_fernet_keys':
    command => "/bin/bash -c 'source /root/keystonerc_admin; /bin/keystone-manage fernet_setup'",
    user    => 'keystone',
    group   => 'keystone',
    onlyif  => '/bin/ls -A /etc/keystone/fernet-keys'
  }
}
