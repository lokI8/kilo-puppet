class ssh::server::config_users (
  $users = $quickstack::params::moc_users
) {

  define config_user ($user_config = $title) {
    $user = $user_config['username']
    $password = $user_config['password']
    $hashed_password = $user_config['hashed_password']

    case $::osfamily {
      redhat: {
        user { $user:
          ensure     => 'present',
          home       => "/home/${user}",
          groups     => 'wheel',
          password   => $hashed_password,
          managehome => true,
        } ->
        file { "/home/${user}/.ssh":
          ensure => directory,
          owner => $user,
          group => $user,
          mode => '0700',
        } ->
        file { "/home/${user}/.ssh/authorized_keys":
          ensure  => present,
          owner   => $user,
          group   => $user,
          mode    => '0600',
          replace => true,
          source  => "puppet:///modules/${module_name}/keys/${user}.pub",
          require => Class['ssh::server::install']
        } ->
        file {"/home/${user}/access.txt":
          ensure  => present,
	  owner   => $user,
	  group   => $user,
	  mode    => '0400',
	  replace => true,
        } ->
        exec {"store-passwd-${user}":
          command => "/bin/echo ${password} > /home/${user}/access.txt",
        }
      }
      default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
      }
    }
  }

  # traverse over users array and configure each user
  config_user { $users: }
}
