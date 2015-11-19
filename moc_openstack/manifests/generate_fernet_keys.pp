# This module does the initial fernet key set-up
class moc_openstack::generate_fernet_keys {
  # Creates the directory if it does not exist
  file { 'create_fernet_directory':
    ensure => 'directory',
    path  => '/etc/keystone/fernet-keys', 
    owner => 'keystone'
    group => 'keystone'
    mode  => '0744',
  }

  # If the directory is empty, runs fernet key generation
  exec { 'generate_fernet_keys':
    command => 'source ~/keystonerc_admin; keystone-manage fernet_setup',
    onlyif  => 'ls -A /etc/keystone/fernet-keys'
  }
}
