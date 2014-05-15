# == Defines jboss_admin::workmanager
#
# jca.workmanager
#
# === Parameters
#
# [*_name*]
#   The name of the WorkManager
#
#
define jboss_admin::resource::workmanager (
  $server,
  $_name                          = undef,
  $ensure                         = present,
  $path                           = $name
) {
  if $ensure == present {

  

    $raw_options = { 
      'name'                         => $_name,
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
