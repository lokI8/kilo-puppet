# Configures nova to talk to ceph 
# This is specific to  compute node
class moc_openstack::configure_nova_ceph($nova_uuid, $rbd_key) {
  if $::osfamily == 'RedHat' {
    file { "/etc/novasecret.xml":
      ensure => present,
      owner => root,
      group => root,
      mode => 755,
      content => template('moc_openstack/novasecret.erb')
    } ->
    exec{"Executing virsh commands":
     require => File["/etc/novasecret.xml"],
     command => "/usr/bin/virsh secret-define --file /etc/novasecret.xml;/usr/bin/virsh secret-set-value --secret $nova_uuid --base64 $rbd_key",
     #onlyif  => "/usr/bin/test ! -f /etc/novasecret.xml",
    }
} else {
    fail("The configure_nova_ceph module is only supported on RedHat systems!")
  }
}
