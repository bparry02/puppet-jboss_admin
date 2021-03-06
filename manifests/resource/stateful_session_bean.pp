# == Defines jboss_admin::stateful_session_bean
#
# Stateful session bean component included in the deployment.
#
# === Parameters
#
# [*component_class_name*]
#   The component's class name.
#
# [*declared_roles*]
#   The roles declared (via @DeclareRoles) on this EJB component.
#
# [*run_as_role*]
#   The run-as role (if any) for this EJB component.
#
# [*security_domain*]
#   The security domain for this EJB component.
#
#
define jboss_admin::resource::stateful_session_bean (
  $server,
  $component_class_name           = undef,
  $declared_roles                 = undef,
  $run_as_role                    = undef,
  $security_domain                = undef,
  $ensure                         = present,
  $cli_path                       = $name,
) {
  if $ensure == present {
    if $declared_roles != undef and $declared_roles != undefined and !is_array($declared_roles) {
      fail('The attribute declared_roles is not an array')
    }

    $raw_options = {
      'component-class-name'         => $component_class_name,
      'declared-roles'               => $declared_roles,
      'run-as-role'                  => $run_as_role,
      'security-domain'              => $security_domain,
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
    jboss_resource { $cli_path:
      ensure => $ensure,
      server => $server
    }
  }
}
