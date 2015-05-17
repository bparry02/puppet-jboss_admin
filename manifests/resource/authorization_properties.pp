# == Defines jboss_admin::authorization_properties
#
# Configuration to use properties file to load a users roles. The entries within the properties file are username={roles} where roles is a comma separated list of users roles.
#
# === Parameters
#
# [*path*]
#   The path of the properties file containing the users roles.
#
# [*relative_to*]
#   The name of another previously named path, or of one of the standard paths provided by the system. If 'relative-to' is provided, the value of the 'path' attribute is treated as relative to the path specified by this attribute.
#
#
define jboss_admin::resource::authorization_properties (
  $server,
  $path                           = undef,
  $relative_to                    = undef,
  $ensure                         = present,
  $cli_path                       = $name
) {
  if $ensure == present {


    $raw_options = {
      'path'                         => $path,
      'relative-to'                  => $relative_to,
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
