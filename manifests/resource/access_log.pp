# == Defines jboss_admin::access_log
#
# The access log configuration for this virtual server.
#
# === Parameters
#
# [*extended*]
#   Enable extended pattern, with more options.
#
# [*pattern*]
#   The access log pattern.
#
# [*prefix*]
#   Prefix for the log file name.
#
# [*resolve_hosts*]
#   Host resolution.
#
# [*rotate*]
#   Rotate the access log every day.
#
#
define jboss_admin::resource::access_log (
  $server,
  $extended                       = undef,
  $pattern                        = undef,
  $prefix                         = undef,
  $resolve_hosts                  = undef,
  $rotate                         = undef,
  $ensure                         = present,
  $path                           = $name
) {
  if $ensure == present {

  

    $raw_options = {
      'extended'                     => $extended,
      'pattern'                      => $pattern,
      'prefix'                       => $prefix,
      'resolve-hosts'                => $resolve_hosts,
      'rotate'                       => $rotate,
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
