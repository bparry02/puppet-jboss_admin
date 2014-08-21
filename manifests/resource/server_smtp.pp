# == Defines jboss_admin::server_smtp
#
# Mail session server
#
# === Parameters
#
# [*outbound_socket_binding_ref*]
#   Outbound Socket binding to mail server
#
# [*password*]
#   Password to authenticate on server
#
# [*ssl*]
#   Does server require SSL?
#
# [*tls*]
#   Does server require TLS?
#
# [*username*]
#   Username to authenticate on server
#
#
define jboss_admin::resource::server_smtp (
  $server,
  $outbound_socket_binding_ref    = undef,
  $password                       = undef,
  $ssl                            = undef,
  $tls                            = undef,
  $username                       = undef,
  $ensure                         = present,
  $path                           = $name
) {
  if $ensure == present {

    if $outbound_socket_binding_ref != undef and !is_string($outbound_socket_binding_ref) { 
      fail('The attribute outbound_socket_binding_ref is not a string') 
    }
    if $password != undef and !is_string($password) { 
      fail('The attribute password is not a string') 
    }
    if $ssl != undef and !is_bool($ssl) { 
      fail('The attribute ssl is not a boolean') 
    }
    if $tls != undef and !is_bool($tls) { 
      fail('The attribute tls is not a boolean') 
    }
    if $username != undef and !is_string($username) { 
      fail('The attribute username is not a string') 
    }
  

    $raw_options = { 
      'outbound-socket-binding-ref'  => $outbound_socket_binding_ref,
      'password'                     => $password,
      'ssl'                          => $ssl,
      'tls'                          => $tls,
      'username'                     => $username,
    }
    $options = delete_undef_values($raw_options)

    jboss_resource { $path:
      ensure  => $ensure,
      server  => $server,
      options => $options
    }


  }

  if $ensure == absent {
    jboss_resource { $path:
      ensure => $ensure,
      server => $server
    }
  }


}
