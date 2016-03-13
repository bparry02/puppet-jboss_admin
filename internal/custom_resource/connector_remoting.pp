# == Defines jboss_admin::connector_remoting
#
# The configuration of a Remoting connector.
#
# === Parameters
#
# [*authentication_provider*]
#   The "authentication-provider" element contains the name of the authentication provider to use for incoming connections.
#
# [*security_realm*]
#   The associated security realm to use for authentication for this connector.
#
# [*socket_binding*]
#   The name (or names) of the socket binding(s) to attach to.
#
#
define jboss_admin::resource::connector_remoting (
  $server,
  $authentication_provider        = undef,
  $security_realm                 = undef,
  $socket_binding                 = undef,
  $ensure                         = present,
  $cli_path                       = $name
) {
  if $ensure == present {
    $raw_options = {
      'authentication-provider'      => $authentication_provider,
      'security-realm'               => $security_realm,
      'socket-binding'               => $socket_binding,
    }
    $options = delete_undef_values($raw_options)

    jboss_resource { $name:
      address => $cli_path,
      ensure  => $ensure,
      server  => $server,
      options => $options
    }


  }

  if $ensure == absent {
    jboss_resource { $name:
      address => $cli_path,
      ensure => $ensure,
      server => $server
    }
  }
}
