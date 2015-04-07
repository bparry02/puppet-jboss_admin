# == Defines jboss_admin::pattern_formatter
#
# A pattern formatter to be used with handlers.
#
# === Parameters
#
# [*color_map*]
#   The color-map attribute allows for a comma delimited list of colors to be used for different levels with a pattern formatter. The format for the color mapping pattern is level-name:color-name.Valid Levels; severe, fatal, error, warn, warning, info, debug, trace, config, fine, finer, finest Valid Colors; black, green, red, yellow, blue, magenta, cyan, white, brightblack, brightred, brightgreen, brightblue, brightyellow, brightmagenta, brightcyan, brightwhite
#
# [*pattern*]
#   Defines a pattern for the formatter.
#
#
define jboss_admin::resource::pattern_formatter (
  $server,
  $color_map                      = undef,
  $pattern                        = undef,
  $ensure                         = present,
  $cli_path                       = $name
) {
  if $ensure == present {

  

    $raw_options = {
      'color-map'                    => $color_map,
      'pattern'                      => $pattern,
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
