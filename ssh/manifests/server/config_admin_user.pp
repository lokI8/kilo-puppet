class ssh::server::config_admin_user (
  $user     = $quickstack::params::moc_admin_user,
  $password = $quickstack::params::moc_admin_password,
) inherits quickstack::params {
  case $::osfamily {
    redhat: {
      user { $user:
        ensure     => 'present',
        home       => "/home/${user}",
        groups     => 'wheel',
        password   => $password,
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
        source  => "puppet:///modules/${module_name}/authorized_keys",
        require => Class['ssh::server::install']
      }
    }
    default: {
        fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }
}
