# == Defines jboss_admin::bootstrap_context
#
# Bootstrap context for resource adapters
#
# === Parameters
#
# [*resource_name*]
#   The name of the BootstrapContext
#
# [*workmanager*]
#   The WorkManager instance for the BootstrapContext
#
#
define jboss_admin::resource::bootstrap_context (
  $server,
  $resource_name                  = undef,
  $workmanager                    = undef,
  $ensure                         = present,
  $cli_path                       = $name
) {
  if $ensure == present {

  

    $raw_options = {
      'name'                         => $resource_name,
      'workmanager'                  => $workmanager,
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
