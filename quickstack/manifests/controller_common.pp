# Quickstack controller node
class quickstack::controller_common (
  $admin_email                   = $quickstack::params::admin_email,
  $admin_password                = $quickstack::params::admin_password,
  $ceilometer_metering_secret    = $quickstack::params::ceilometer_metering_secret,
  $ceilometer_user_password      = $quickstack::params::ceilometer_user_password,
  $ceph_cluster_network          = '',
  $ceph_public_network           = '',
  $ceph_fsid                     = '',
  $ceph_images_key               = '',
  $ceph_volumes_key              = '',
  $ceph_mon_host                 = [ ],
  $ceph_mon_initial_members      = [ ],
  $ceph_osd_pool_default_size    = '',
  $ceph_osd_journal_size         = '',
  $cinder_backend_eqlx           = $quickstack::params::cinder_backend_eqlx,
  $cinder_backend_eqlx_name      = $quickstack::params::cinder_backend_eqlx_name,
  $cinder_backend_gluster        = $quickstack::params::cinder_backend_gluster,
  $cinder_backend_gluster_name   = $quickstack::params::cinder_backend_gluster_name,
  $cinder_backend_iscsi          = $quickstack::params::cinder_backend_iscsi,
  $cinder_backend_iscsi_name     = $quickstack::params::cinder_backend_iscsi_name,
  $cinder_backend_netapp         = $quickstack::params::cinder_backend_netapp,
  $cinder_backend_netapp_name    = $quickstack::params::cinder_backend_netapp_name,
  $cinder_backend_nfs            = $quickstack::params::cinder_backend_nfs,
  $cinder_backend_nfs_name       = $quickstack::params::cinder_backend_nfs_name,
  $cinder_backend_rbd            = $quickstack::params::cinder_backend_rbd,
  $cinder_backend_rbd_name       = $quickstack::params::cinder_backend_rbd_name,
  $cinder_db_password            = $quickstack::params::cinder_db_password,
  $cinder_multiple_backends      = $quickstack::params::cinder_multiple_backends,
  $cinder_create_volume_types    = true,
  $cinder_gluster_shares         = $quickstack::params::cinder_gluster_shares,
  $cinder_nfs_shares             = $quickstack::params::cinder_nfs_shares,
  $cinder_nfs_mount_options      = $quickstack::params::cinder_nfs_mount_options,
  $cinder_san_ip                 = $quickstack::params::cinder_san_ip,
  $cinder_san_login              = $quickstack::params::cinder_san_login,
  $cinder_san_password           = $quickstack::params::cinder_san_password,
  $cinder_san_thin_provision     = $quickstack::params::cinder_san_thin_provision,
  $cinder_eqlx_group_name        = $quickstack::params::cinder_eqlx_group_name,
  $cinder_eqlx_pool              = $quickstack::params::cinder_eqlx_pool,
  $cinder_eqlx_use_chap          = $quickstack::params::cinder_eqlx_use_chap,
  $cinder_eqlx_chap_login        = $quickstack::params::cinder_eqlx_chap_login,
  $cinder_eqlx_chap_password     = $quickstack::params::cinder_eqlx_chap_password,
  $cinder_netapp_hostname          = $quickstack::params::cinder_netapp_hostname,
  $cinder_netapp_login             = $quickstack::params::cinder_netapp_login,
  $cinder_netapp_password          = $quickstack::params::cinder_netapp_password,
  $cinder_netapp_server_port       = $quickstack::params::cinder_netapp_server_port,
  $cinder_netapp_storage_family    = $quickstack::params::cinder_netapp_storage_family,
  $cinder_netapp_transport_type    = $quickstack::params::cinder_netapp_transport_type,
  $cinder_netapp_storage_protocol  = $quickstack::params::cinder_netapp_storage_protocol,
  $cinder_netapp_nfs_shares        = $quickstack::params::cinder_netapp_nfs_shares,
  $cinder_netapp_nfs_shares_config = $quickstack::params::cinder_netapp_nfs_shares_config,
  $cinder_netapp_volume_list       = $quickstack::params::cinder_netapp_volume_list,
  $cinder_netapp_vfiler            = $quickstack::params::cinder_netapp_vfiler,
  $cinder_netapp_vserver           = $quickstack::params::cinder_netapp_vserver,
  $cinder_netapp_controller_ips    = $quickstack::params::cinder_netapp_controller_ips,
  $cinder_netapp_sa_password       = $quickstack::params::cinder_netapp_sa_password,
  $cinder_netapp_storage_pools     = $quickstack::params::cinder_netapp_storage_pools,
  $cinder_rbd_pool               = $quickstack::params::cinder_rbd_pool,
  $cinder_rbd_ceph_conf          = $quickstack::params::cinder_rbd_ceph_conf,
  $cinder_rbd_flatten_volume_from_snapshot
                                 = $quickstack::params::cinder_rbd_flatten_volume_from_snapshot,
  $cinder_rbd_max_clone_depth    = $quickstack::params::cinder_rbd_max_clone_depth,
  $cinder_rbd_user               = $quickstack::params::cinder_rbd_user,
  $cinder_rbd_secret_uuid        = $quickstack::params::cinder_rbd_secret_uuid,
  $cinder_user_password          = $quickstack::params::cinder_user_password,
  $controller_admin_host         = $quickstack::params::controller_admin_host,
  $controller_priv_host          = $quickstack::params::controller_priv_host,
  $controller_pub_host           = $quickstack::params::controller_pub_host,
  #New for OSP Keystone module, and related [service]/keystone/auth manifests
  $keystone_admin_url            = $quickstack::params::keystone_admin_url,
  $keystone_priv_url             = $quickstack::params::keystone_priv_url,
  $keystone_pub_url              = $quickstack::params::keystone_pub_url,
  $nova_admin_url                = $quickstack::params::nova_admin_url,
  $nova_priv_url                 = $quickstack::params::nova_priv_url,
  $nova_pub_url                  = $quickstack::params::nova_pub_url,
  $nova_admin_url_v3             = $quickstack::params::nova_admin_url_v3,
  $nova_public_url_v3            = $quickstack::params::nova_public_url_v3,
  $nova_internal_url_v3          = $quickstack::params::nova_internal_url_v3,
  $glance_admin_url              = $quickstack::params::glance_admin_url,
  $glance_priv_url               = $quickstack::params::glance_priv_url,
  $glance_pub_url                = $quickstack::params::glance_pub_url,
  $neutron_admin_url             = $quickstack::params::neutron_admin_url,
  $neutron_priv_url              = $quickstack::params::neutron_priv_url,
  $neutron_pub_url               = $quickstack::params::neutron_pub_url,
  $cinder_admin_url              = $quickstack::params::cinder_admin_url,
  $cinder_priv_url               = $quickstack::params::cinder_priv_url,
  $cinder_pub_url                = $quickstack::params::cinder_pub_url,
  #

  $glance_db_password            = $quickstack::params::glance_db_password,
  $glance_user_password          = $quickstack::params::glance_user_password,
  $glance_backend                = $quickstack::params::glance_backend,
  $glance_rbd_store_user         = $quickstack::params::glance_rbd_store_user,
  $glance_rbd_store_pool         = $quickstack::params::glance_rbd_store_pool,
  $heat_cfn                      = $quickstack::params::heat_cfn,
  $heat_cloudwatch               = $quickstack::params::heat_cloudwatch,
  $heat_db_password              = $quickstack::params::heat_db_password,
  $heat_user_password            = $quickstack::params::heat_user_password,
  #Was breaking puppet
  #$heat_auth_encrypt_key,
  $horizon_secret_key            = $quickstack::params::horizon_secret_key,
  $keystone_admin_token          = $quickstack::params::keystone_admin_token,
  $keystone_db_password          = $quickstack::params::keystone_db_password,
  $keystonerc                    = true,
  $neutron_metadata_proxy_secret = $quickstack::params::neutron_metadata_proxy_secret,
  $mysql_host                    = $quickstack::params::mysql_host,
  $mysql_root_password           = $quickstack::params::mysql_root_password,
  $neutron                       = $quickstack::params::neutron,
  $neutron_core_plugin           = $quickstack::params::neutron_core_plugin,
  $neutron_db_password           = $quickstack::params::neutron_db_password,
  $neutron_user_password         = $quickstack::params::neutron_user_password,
  $nova_db_password              = $quickstack::params::nova_db_password,
  $nova_user_password            = $quickstack::params::nova_user_password,
  $nova_default_floating_pool    = $quickstack::params::nova_default_floating_pool,
  $swift_shared_secret           = $quickstack::params::swift_shared_secret,
  $swift_admin_password          = $quickstack::params::swift_admin_password,
  $swift_ringserver_ip           = '192.168.203.1',
  $swift_storage_ips             = ["192.168.203.2","192.168.203.3","192.168.203.4"],
  $swift_storage_device          = 'device1',
  $amqp_provider                 = $quickstack::params::amqp_provider,
  $amqp_host                     = $quickstack::params::amqp_host,
  $amqp_username                 = $quickstack::params::amqp_username,
  $amqp_password                 = $quickstack::params::amqp_password,
  $verbose                       = $quickstack::params::verbose,
  $ssl                           = $quickstack::params::ssl,
  $mysql_ssl                     = $quickstack::params::mysql_ssl,
  $amqp_ssl                      = $quickstack::params::amqp_ssl,
  $horizon_ssl                   = $quickstack::params::horizon_ssl,
  $support_profile               = $quickstack::params::support_profile,
  $freeipa                       = $quickstack::params::freeipa,
  $mysql_ca                      = $quickstack::params::mysql_ca,
  $mysql_cert                    = $quickstack::params::mysql_cert,
  $mysql_key                     = $quickstack::params::mysql_key,
  $amqp_ca                       = $quickstack::params::amqp_ca,
  $amqp_cert                     = $quickstack::params::amqp_cert,
  $amqp_key                      = $quickstack::params::amqp_key,
  $horizon_ca                    = $quickstack::params::horizon_ca,
  $horizon_cert                  = $quickstack::params::horizon_cert,
  $horizon_key                   = $quickstack::params::horizon_key,
  $amqp_nssdb_password           = $quickstack::params::amqp_nssdb_password,
  $ceph_nodes                    = $quickstack::params::ceph_nodes,
  $ceph_enpoints                 = $quickstack::params::ceph_endpoints,
  $ceph_user                     = $quickstack::params::ceph_user,
  $ceph_vlan                     = $quickstack::params::ceph_vlan,
  $sensu_rabbitmq_host           = $quickstack::params::sensu_rabbitmq_host,
  $sensu_rabbitmq_user           = $quickstack::params::sensu_rabbitmq_user,
  $sensu_rabbitmq_password       = $quickstack::params::sensu_rabbitmq_password,
  $sensu_client_subscriptions_controller   = ['moc-sensu','openstack-api','openstack-metrics'],
  $ceph_key                      = $quickstack::params::ceph_key,
  $use_ssl_endpoints             = $quickstack::params::use_ssl_endpoints,
  $neutron_admin_password        = $quickstack::params::neutron_user_password,
  $root_ca_cert                  = $quickstack::params::root_ca_cert,
  $horizon_key                   = $quickstack::params::horizon_key,
  $horizon_cert                  = $quickstack::params::horizon_cert,
  $nova_key                      = $quickstack::params::nova_key,
  $nova_cert                     = $quickstack::params::nova_cert,
  $keystone_key                  = $quickstack::params::keystone_key,
  $keystone_cert                 = $quickstack::params::keystone_cert,
  $cinder_key                    = $quickstack::params::cinder_key,
  $cinder_cert                   = $quickstack::params::cinder_cert,
  $glance_key                    = $quickstack::params::glance_key,
  $glance_cert                   = $quickstack::params::glance_cert,
  $neutron_key                   = $quickstack::params::neutron_key,
  $neutron_cert                  = $quickstack::params::neutron_cert,
  $source                        = $quickstack::params::source,
  $ntp_public_servers            = $quickstack::params::ntp_public_servers,
) inherits quickstack::params {

  if str2bool_i("$use_ssl_endpoints") {
    $auth_protocol = 'https'
  } else {
    $auth_protocol = 'http'
  }

  class {'quickstack::openstack_common': }
  include ::quickstack::cron::keystone_token

  if str2bool_i("$ssl") {
    class {'moc_openstack::ssl::install_rootca':
      before  => Class['quickstack::amqp::server', 'quickstack::db::mysql'],
    }

    if str2bool_i("$amqp_ssl"){
      $qpid_protocol    = 'ssl'
      $amqp_port        = '5671'
    } else {
      $qpid_protocol    = 'tcp'
      $amqp_port        = '5672'
    }

    if str2bool_i("$mysql_ssl") {
      $nova_sql_connection = "mysql://nova:${nova_db_password}@${mysql_host}/nova?ssl_ca=${mysql_ca}"
    } else {
      $nova_sql_connection = "mysql://nova:${nova_db_password}@${mysql_host}/nova"
    }

    if str2bool_i("$horizon_ssl") {
      class {'moc_openstack::ssl::add_horizon_cert':
        before => Class['::horizon'],
      }
      apache::listen { '443': }
    }

    if str2bool_i("$freeipa") {
      certmonger::request_ipa_cert { 'mysql':
        seclib    => "openssl",
        principal => "mysql/${controller_priv_host}",
        key       => $mysql_key,
        cert      => $mysql_cert,
        owner_id  => 'mysql',
        group_id  => 'mysql',
      }
      certmonger::request_ipa_cert { 'horizon':
        seclib    => "openssl",
        principal => "horizon/${controller_pub_host}",
        key       => $horizon_key,
        cert      => $horizon_cert,
        owner_id  => 'apache',
        group_id  => 'apache',
        hostname  => $controller_pub_host,
      }
      if $amqp_provider == 'rabbitmq' {
        certmonger::request_ipa_cert { 'amqp':
          seclib    => "openssl",
          principal => "amqp/${controller_priv_host}",
          key       => $amqp_key,
          cert      => $amqp_cert,
          owner_id  => 'rabbitmq',
          group_id  => 'rabbitmq',
        }
      }
    } else {
      if str2bool_i("$mysql_ssl") {
        if $mysql_ca == undef or $mysql_cert == undef or
        $mysql_key == undef {
          fail('The mysql CA, cert and key are all required.')
        }
      }
      if str2bool_i("$amqp_ssl") {
        if $amqp_ca == undef or $amqp_cert == undef or
        $amqp_key == undef {
          fail('The amqp CA, cert and key are all required.')
        }
      }
      if str2bool_i("$horizon_ssl") {
        if $horizon_ca == undef or $horizon_cert == undef or
        $horizon_key == undef {
          fail('The horizon CA, cert and key are all required.')
        }
      }
    }

    if str2bool_i("$use_ssl_endpoints") {
      class {'moc_openstack::ssl::add_keystone_cert':}
    }

    #class {'::moc_openstack::ssl::additional_params':}

  } else {
      $qpid_protocol = 'tcp'
      $amqp_port = '5672'
      $nova_sql_connection = "mysql://nova:${nova_db_password}@${mysql_host}/nova"
  }

  class {'quickstack::db::mysql':
    mysql_root_password  => $mysql_root_password,
    keystone_db_password => $keystone_db_password,
    glance_db_password   => $glance_db_password,
    nova_db_password     => $nova_db_password,
    cinder_db_password   => $cinder_db_password,
    neutron_db_password  => $neutron_db_password,

    # MySQL
    mysql_bind_address     => '0.0.0.0',
    mysql_account_security => true,
    mysql_ssl              => $mysql_ssl,
    mysql_ca               => $mysql_ca,
    mysql_cert             => $mysql_cert,
    mysql_key              => $mysql_key,

    allowed_hosts          => ['%',$controller_priv_host],
    enabled                => true,

    # Networking
    neutron                => str2bool_i("$neutron"),
  }

  class {'quickstack::amqp::server':
    amqp_provider => $amqp_provider,
    amqp_host     => $amqp_host,
    amqp_port     => $amqp_port,
    amqp_username => $amqp_username,
    amqp_password => $amqp_password,
    amqp_ca       => $amqp_ca,
    amqp_cert     => $amqp_cert,
    amqp_key      => $amqp_key,
    ssl           => $amqp_ssl,
    freeipa       => $freeipa,
  }

  #Requires stackforge/puppet-openstack module to pipe things to ::keystone
  class {'openstack::keystone':
    db_host                 => $mysql_host,
    db_password             => $keystone_db_password,
    db_ssl                  => $mysql_ssl,
    db_ssl_ca               => $mysql_ca,
    admin_token             => $keystone_admin_token,
    admin_email             => $admin_email,
    admin_password          => $admin_password,
    glance_user_password    => $glance_user_password,
    nova_user_password      => $nova_user_password,
    cinder_user_password    => $cinder_user_password,
    neutron_user_password   => $neutron_user_password,
    public_protocol         => $auth_protocol,
    internal_protocol       => $auth_protocol,
    admin_protocol          => $auth_protocol,

    #Not being passed to ::keystone, but still included in OS-puppet
    public_address          => $controller_pub_host,
    admin_address           => $controller_admin_host,
    internal_address        => $controller_priv_host,

    #Being used in newest version of bottom level keystone module
    public_url              => $keystone_pub_url,
    admin_url               => $keystone_admin_url,
    internal_url            => $keystone_priv_url,

    keystone_admin_url      => $keystone_admin_url,
    keystone_priv_url       => $keystone_priv_url ,
    keystone_pub_url        => $keystone_pub_url,
    nova_admin_url          => $nova_admin_url,
    nova_priv_url           => $nova_priv_url,
    nova_pub_url            => $nova_pub_url,
    nova_public_url_v3      => $nova_public_url_v3,
    nova_internal_url_v3    => $nova_internal_url_v3,
    nova_admin_url_v3       => $nova_admin_url_v3,
    glance_admin_url        => $glance_admin_url,
    glance_priv_url         => $glance_priv_url,
    glance_pub_url          => $glance_pub_url,
    neutron_admin_url       => $neutron_admin_url,
    neutron_priv_url        => $neutron_priv_url,
    neutron_pub_url         => $neutron_pub_url,
    cinder_admin_url        => $cinder_admin_url,
    cinder_priv_url         => $cinder_priv_url,
    cinder_pub_url          => $cinder_pub_url,

    glance_public_address   => $controller_pub_host,
    glance_admin_address    => $controller_admin_host,
    glance_internal_address => $controller_priv_host,

    nova_public_address     => $controller_pub_host,
    nova_admin_address      => $controller_admin_host,
    nova_internal_address   => $controller_priv_host,

    cinder_public_address   => $controller_pub_host,
    cinder_admin_address    => $controller_admin_host,
    cinder_internal_address => $controller_priv_host,

    neutron_public_address   => $controller_pub_host,
    neutron_admin_address    => $controller_admin_host,
    neutron_internal_address => $controller_priv_host,

    neutron                 => str2bool_i("$neutron"),
    enabled                 => true,
    enable_ssl              => $use_ssl_endpoints,
    ssl_certfile            => $keystone_cert,
    ssl_keyfile             => $keystone_key,
    ssl_ca_certs            => $root_ca_cert,
    require                 => Class['quickstack::db::mysql'],
  }

  class { 'swift::keystone::auth':
    password         => $swift_admin_password,
    public_address   => $controller_pub_host,
    internal_address => $controller_priv_host,
    admin_address    => $controller_admin_host
  }

  class {'quickstack::glance':
    db_host        => $mysql_host,
    db_ssl         => $mysql_ssl,
    db_ssl_ca      => $mysql_ca,
    user_password  => $glance_user_password,
    db_password    => $glance_db_password,
    backend        => $glance_backend,
    rbd_store_user => $glance_rbd_store_user,
    rbd_store_pool => $glance_rbd_store_pool,
    require        => Class['quickstack::db::mysql'],
    amqp_host      => $amqp_host,
    amqp_port      => $amqp_port,
    amqp_username  => $amqp_username,
    amqp_password  => $amqp_password,
    amqp_provider  => $amqp_provider,
    rabbit_use_ssl => $amqp_ssl,
    cert_file      => $glance_cert,
    key_file       => $glance_key,
    ca_file        => $root_ca_cert,
    auth_host      => $controller_pub_host,
    auth_protocol  => $auth_protocol,
    auth_uri       => $keystone_pub_url,
    identity_uri   => $keystone_admin_url,
    keystone_host  => $controller_pub_host,
  }

  # Configure Nova
  class { '::nova':
    #database_connection => $nova_sql_connection,
    image_service       => 'nova.image.glance.GlanceImageService',
    glance_api_servers  => "${glance_priv_url}/v1",
    rpc_backend         => amqp_backend('nova', $amqp_provider),
    qpid_hostname       => $amqp_host,
    qpid_username       => $amqp_username,
    qpid_password       => $amqp_password,
    rabbit_host         => $amqp_host,
    rabbit_userid       => $amqp_username,
    rabbit_password     => $amqp_password,
    rabbit_port         => $amqp_port,
    rabbit_use_ssl      => $amqp_ssl,
    verbose             => $verbose,
    qpid_protocol       => $qpid_protocol,
    qpid_port           => $amqp_port,
    require             => Class['quickstack::db::mysql', 'quickstack::amqp::server'],
    controller_pub_host => $controller_pub_host,
    use_ssl             => $use_ssl_endpoints,
    enabled_ssl_apis    => ['osapi_compute'],
    ca_file             => $root_ca_cert,
    key_file            => $nova_key,
    cert_file           => $nova_cert,
  }

  nova_config {
    'DEFAULT/default_floating_pool': value => $nova_default_floating_pool;
  }

  if str2bool_i("$neutron") {
    class { '::nova::api':
      enabled           => true,
      admin_password    => $nova_user_password,
      auth_host         => $controller_priv_host,
      auth_protocol     => $auth_protocol,
      auth_uri          => $keystone_pub_url,
      identity_uri      => $keystone_admin_url,
      neutron_metadata_proxy_shared_secret => $neutron_metadata_proxy_secret,
    }
  } else {
    class { '::nova::api':
      enabled           => true,
      admin_password    => $nova_user_password,
      auth_host         => $controller_priv_host,
      auth_protocol     => $auth_protocol,
      auth_uri          => $keystone_pub_url,
      identity_uri      => $keystone_admin_url,
    }
  }

  class { [ '::nova::scheduler', '::nova::cert', '::nova::consoleauth', '::nova::conductor' ]:
    enabled => true,
  }

  class { '::nova::vncproxy':
    host    => '0.0.0.0',
    enabled => true,
  }

#  class { 'quickstack::ceilometer_controller':
#    ceilometer_metering_secret  => $ceilometer_metering_secret,
#    ceilometer_user_password    => $ceilometer_user_password,
#    controller_admin_host       => $controller_admin_host,
#    controller_priv_host        => $controller_priv_host,
#    controller_pub_host         => $controller_pub_host,
#    amqp_provider               => $amqp_provider,
#    amqp_host                   => $amqp_host,
#    qpid_protocol               => $qpid_protocol,
#    amqp_port                   => $amqp_port,
#    amqp_username               => $amqp_username,
#    amqp_password               => $amqp_password,
#    rabbit_use_ssl              => $amqp_ssl,
#    verbose                     => $verbose,
#  }

#  class {'quickstack::swift::proxy':
#    swift_proxy_host           => $controller_pub_host,
#    keystone_host              => $controller_pub_host,
#    swift_admin_password       => $swift_admin_password,
#    swift_shared_secret        => $swift_shared_secret,
#    swift_storage_ips          => $swift_storage_ips,
#    swift_storage_device       => $swift_storage_device,
#    swift_ringserver_ip        => $swift_ringserver_ip,
#    swift_is_ringserver        => true,
#  }

  class { 'quickstack::cinder':
    user_password  => $cinder_user_password,
    db_host        => $mysql_host,
    db_ssl         => $mysql_ssl,
    db_ssl_ca      => $mysql_ca,
    db_password    => $cinder_db_password,
    glance_host    => $controller_priv_host,
    keystone_host  => $controller_priv_host,
    rpc_backend    => amqp_backend('cinder', $amqp_provider),
    amqp_host      => $amqp_host,
    amqp_port      => $amqp_port,
    amqp_username  => $amqp_username,
    amqp_password  => $amqp_password,
    qpid_protocol  => $qpid_protocol,
    rabbit_use_ssl => $amqp_ssl,
    verbose        => $verbose,
    auth_uri       => $keystone_pub_url,
    identity_uri   => $keystone_admin_url,
    use_ssl        => $use_ssl_endpoints,
    cert_file      => $cinder_cert,
    key_file       => $cinder_key,
    ca_file        => $root_ca_cert,
    nova_pub_url   => $nova_pub_url,
  }

  # preserve original behavior - fall back to iscsi
  # https://github.com/redhat-openstack/astapor/blob/7cf25e1022bee08b0c385ae956d4e9e4ade14a9d/puppet/modules/quickstack/manifests/cinder_controller.pp#L85
  if (!str2bool_i("$cinder_backend_gluster") and
      !str2bool_i("$cinder_backend_eqlx") and
      !str2bool_i("$cinder_backend_netapp") and
      !str2bool_i("$cinder_backend_rbd") and
      !str2bool_i("$cinder_backend_nfs")) {
    $cinder_backend_iscsi_with_fallback = 'true'
  } else {
    $cinder_backend_iscsi_with_fallback = $cinder_backend_iscsi
  }

  if (str2bool_i("$cinder_backend_rbd") or ($glance_backend == 'rbd')) {
    include ::quickstack::ceph::client_packages
    # hack around the glance package declaration if needed
    if ($glance_backend != 'rbd') {
      package {'python-rbd': } -> Class['quickstack::ceph::client_packages']
    }
    if $ceph_fsid {
      class { '::quickstack::ceph::config':
        fsid                  => $ceph_fsid,
        cluster_network       => $ceph_cluster_network,
        public_network        => $ceph_public_network,
        mon_initial_members   => $ceph_mon_initial_members,
        mon_host              => $ceph_mon_host,
        images_key            => $ceph_images_key,
        volumes_key           => $ceph_volumes_key,
        osd_pool_default_size => $ceph_osd_pool_default_size,
        osd_journal_size      => $ceph_osd_journal_size,
      } -> Class['quickstack::ceph::client_packages']
    }
  }

  class { 'quickstack::cinder_volume':
    backend_eqlx           => $cinder_backend_eqlx,
    backend_eqlx_name      => $cinder_backend_eqlx_name,
    backend_glusterfs      => $cinder_backend_gluster,
    backend_glusterfs_name => $cinder_backend_gluster_name,
    backend_iscsi          => $cinder_backend_iscsi_with_fallback,
    backend_iscsi_name     => $cinder_backend_iscsi_name,
    backend_netapp         => $cinder_backend_netapp,
    backend_netapp_name    => $cinder_backend_netapp_name,
    backend_nfs            => $cinder_backend_nfs,
    backend_nfs_name       => $cinder_backend_nfs_name,
    backend_rbd            => $cinder_backend_rbd,
    backend_rbd_name       => $cinder_backend_rbd_name,
    multiple_backends      => $cinder_multiple_backends,
    iscsi_bind_addr        => $controller_priv_host,
    glusterfs_shares       => $cinder_gluster_shares,
    nfs_shares             => $cinder_nfs_shares,
    nfs_mount_options      => $cinder_nfs_mount_options,
    san_ip                 => $cinder_san_ip,
    san_login              => $cinder_san_login,
    san_password           => $cinder_san_password,
    san_thin_provision     => $cinder_san_thin_provision,
    eqlx_group_name        => $cinder_eqlx_group_name,
    eqlx_pool              => $cinder_eqlx_pool,
    eqlx_use_chap          => $cinder_eqlx_use_chap,
    eqlx_chap_login        => $cinder_eqlx_chap_login,
    eqlx_chap_password     => $cinder_eqlx_chap_password,
    netapp_hostname          => $cinder_netapp_hostname,
    netapp_login             => $cinder_netapp_login,
    netapp_password          => $cinder_netapp_password,
    netapp_server_port       => $cinder_netapp_server_port,
    netapp_storage_family    => $cinder_netapp_storage_family,
    netapp_transport_type    => $cinder_netapp_transport_type,
    netapp_storage_protocol  => $cinder_netapp_storage_protocol,
    netapp_nfs_shares        => $cinder_netapp_nfs_shares,
    netapp_nfs_shares_config => $cinder_netapp_nfs_shares_config,
    netapp_volume_list       => $cinder_netapp_volume_list,
    netapp_vfiler            => $cinder_netapp_vfiler,
    netapp_vserver           => $cinder_netapp_vserver,
    netapp_controller_ips    => $cinder_netapp_controller_ips,
    netapp_sa_password       => $cinder_netapp_sa_password,
    netapp_storage_pools     => $cinder_netapp_storage_pools,
    rbd_pool               => $cinder_rbd_pool,
    rbd_ceph_conf          => $cinder_rbd_ceph_conf,
    rbd_flatten_volume_from_snapshot
                           => $cinder_rbd_flatten_volume_from_snapshot,
    rbd_max_clone_depth    => $cinder_rbd_max_clone_depth,
    rbd_user               => $cinder_rbd_user,
    rbd_secret_uuid        => $cinder_rbd_secret_uuid,
  }

  if str2bool_i("$cinder_create_volume_types") and str2bool_i("$cinder_multiple_backends") {
    Class['::cinder::keystone::auth'] ->
    class {'::quickstack::cinder_volume_types':
      backend_glusterfs      => $cinder_backend_gluster,
      backend_glusterfs_name => $cinder_backend_gluster_name,
      backend_iscsi          => $cinder_backend_iscsi,
      backend_iscsi_name     => $cinder_backend_iscsi_name,
      backend_nfs            => $cinder_backend_nfs,
      backend_nfs_name       => $cinder_backend_nfs_name,
      backend_eqlx           => $cinder_backend_eqlx,
      backend_eqlx_name      => $cinder_backend_eqlx_name,
      backend_netapp         => $cinder_backend_netapp,
      backend_netapp_name    => $cinder_backend_netapp_name,
      backend_rbd            => $cinder_backend_rbd,
      backend_rbd_name       => $cinder_backend_rbd_name,
      os_username            => 'admin',
      os_tenant_name         => 'admin',
      os_password            => $admin_password,
      os_auth_url            => "${auth_protocol}://${controller_admin_host}:35357/v2.0/",
      cinder_api_host        => $controller_admin_host,
    }
  }

#  class { 'quickstack::heat_controller':
#    auth_encryption_key         => $heat_auth_encrypt_key,
#    heat_cfn                    => $heat_cfn,
#    heat_cloudwatch             => $heat_cloudwatch,
#    heat_user_password          => $heat_user_password,
#    heat_db_password            => $heat_db_password,
#    controller_admin_host       => $controller_admin_host,
#    controller_priv_host        => $controller_priv_host,
#    controller_pub_host         => $controller_pub_host,
#    mysql_host                  => $mysql_host,
#    mysql_ca                    => $mysql_ca,
#    ssl                         => $ssl,
#    amqp_provider               => $amqp_provider,
#    amqp_host                   => $amqp_host,
#    amqp_port                   => $amqp_port,
#    qpid_protocol               => $qpid_protocol,
#    amqp_username               => $amqp_username,
#    amqp_password               => $amqp_password,
#    verbose                     => $verbose,
#  }

  # horizon packages
  package {'python-memcached':
    ensure => installed,
  }~>
  package {'python-netaddr':
    ensure => installed,
    notify => Class['::horizon'],
  }

  file {'/etc/httpd/conf.d/rootredirect.conf':
    ensure  => present,
    content => 'RedirectMatch ^/$ /dashboard/',
    notify  => File['/etc/httpd/conf.d/openstack-dashboard.conf'],
  }

  class {'::horizon':
    secret_key            => $horizon_secret_key,
    keystone_default_role => '_member_',
    #Keystone_host now keystone_url
    #keystone_host         => $controller_priv_host,
    keystone_url          => "$keystone_pub_url/v2.0",
    fqdn                  => ["$controller_pub_host", "$::fqdn", "$::hostname", 'localhost', '*'],
    listen_ssl            => str2bool_i("$horizon_ssl"),
    horizon_cert          => $horizon_cert,
    horizon_key           => $horizon_key,
    horizon_ca            => $horizon_ca,
    neutron_options       => { 'profile_support' => $support_profile },
  }

  class {'memcached':}

  firewall { '001 controller incoming':
    proto    => 'tcp',
    dport    => ['80', '443', '3260', '3306', '5000', '35357', '5672', '8773', '8774', '8775', '8776', '8777', '9292', '6080'],
    action   => 'accept',
  }

  firewall { '001 controller incoming pt2':
    proto    => 'tcp',
    dport    => ['8000', '8003', '8004','6789'],
    action   => 'accept',
  }

  if $ssl {
    if str2bool_i("$horizon_ssl") {
      firewall { '002 horizon incoming':
        proto  => 'tcp',
        dport  => ['443',],
        action => 'accept',
      }
    }

    if str2bool_i("$amqp_ssl") {
      firewall { '003 amqp incoming':
        proto    => 'tcp',
        dport    => ['5671',],
        action   => 'accept',
      }
    }
  }

  if ($::selinux != "false"){
    selboolean { 'httpd_can_network_connect':
      value => on,
      persistent => true,
    }
  }

  # This exists to cover havana release, where we only exposed the pub and priv
  # hosts, admin was not a param there.
  if $controller_admin_host == undef or $controller_admin_host == '' {
    $real_admin_host = $controller_priv_host
  } else {
    $real_admin_host = $controller_admin_host
  }

  if str2bool_i("$keystonerc") {
    class { 'quickstack::admin_client':
      admin_password        => $admin_password,
      controller_admin_host => $real_admin_host,
      auth_protocol         => $auth_protocol,
    }
  }


  #Customization for intalling ceph and conf files 
  #class moc_openstack::install_ceph($ceph_nodes,$ceph_endpoints,$ceph_user) 


  class { 'moc_openstack::install_ceph':
    ceph_nodes     => $ceph_nodes,
    ceph_endpoints => $ceph_endpoints,
    ceph_user      => $ceph_user,
    ceph_iface     => $ceph_iface,
    ceph_key       => $ceph_key, 
    ceph_vlan      => $ceph_vlan,
}

# Ensure ruby has lastest version
  package { "ruby":
    ensure => latest,
  }

  package { "rubygems":
    ensure => latest,
  }

#Customization for isntalling sensu
  class { '::sensu':
    sensu_plugin_name => 'sensu-plugin',
    sensu_plugin_version => 'installed',
    sensu_plugin_provider => 'gem',
    purge_config => true,
    rabbitmq_host => $sensu_rabbitmq_host,
    rabbitmq_user => $sensu_rabbitmq_user,
    rabbitmq_password => $sensu_rabbitmq_password,
    rabbitmq_vhost => '/sensu',
    subscriptions => $sensu_client_subscriptions_controller,
    plugins       => [
       "puppet:///modules/sensu/plugins/check-ip-connectivity.sh",
       "puppet:///modules/sensu/plugins/check-mem.sh",
       "puppet:///modules/sensu/plugins/cpu-metrics.rb",
       "puppet:///modules/sensu/plugins/disk-usage-metrics.rb",
       "puppet:///modules/sensu/plugins/load-metrics.rb",
       "puppet:///modules/sensu/plugins/ceph-osd-metrics.rb",
       "puppet:///modules/sensu/plugins/check-ceph.rb",
       "puppet:///modules/sensu/plugins/check-disk-fail.rb",
       "puppet:///modules/sensu/plugins/memory-metrics.rb",
       "puppet:///modules/sensu/plugins/uptime-metrics.py",
       "puppet:///modules/sensu/plugins/check_keystone-api.sh",
       "puppet:///modules/sensu/plugins/check_neutron-api.py",
       "puppet:///modules/sensu/plugins/keystone-token-metrics.rb",
       "puppet:///modules/sensu/plugins/neutron-agent-status.py",
       "puppet:///modules/sensu/plugins/nova-hypervisor-metrics.py",
       "puppet:///modules/sensu/plugins/nova-server-state-metrics.py",
       "puppet:///modules/sensu/plugins/cpu-pcnt-usage-metrics.rb"
    ]
  }

  class { 'moc_openstack::firewall':
    interface => $ceph_iface,
    source    => $source,
  }

  class {'quickstack::ntp':
    servers => $ntp_public_servers,
  }

  # Generate fernet keys and key directory, if they do not exist
  class {'moc_openstack::generate_fernet_keys':
    require => ['quickstack::admin_client'] 
  }

  # Create semodule for keystone-all access to fernet keys
  class {'moc_openstack::keystone_all_semodule'
    require => ['moc_openstack::generate_fernet_keys'] 
  }

}
