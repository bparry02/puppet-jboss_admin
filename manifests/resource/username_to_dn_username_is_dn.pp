# == Defines jboss_admin::username_to_dn_username_is_dn
#
# User search configuration where the username is already a distinguished name.
#
# === Parameters
#
# [*force*]
#   Authentication may have already converted the username to a distingushed name, force this to occur again before loading groups.
#
#
define jboss_admin::resource::username_to_dn_username_is_dn (
  $server,
  $force                          = undef,
  $ensure                         = present,
  $cli_path                       = $name
) {
  if $ensure == present {

    if $force != undef and $force != undefined {
      validate_bool($force)
    }

    $raw_options = {
      'force'                        => $force,
    }
    $options = delete_undef_values($raw_options)

    jboss_resource { $cli_path:
      ensure  => $ensure,
      server  => $server,
      options => $options
    }


  }

  if $ensure == absent {
    jboss_resource { $cli_path:
      ensure => $ensure,
      server => $server
    }
  }


}
