# == Defines jboss_admin::data_source
#
# A JDBC data-source configuration
#
# === Parameters
#
# [*allocation_retry*]
#   The allocation retry element indicates the number of times that allocating a connection should be tried before throwing an exception
#
# [*allocation_retry_wait_millis*]
#   The allocation retry wait millis element specifies the amount of time, in milliseconds, to wait between retrying to allocate a connection
#
# [*background_validation*]
#   An element to specify that connections should be validated on a background thread versus being validated prior to use. Changing this value can be done only on disabled datasource,  requires a server restart otherwise.
#
# [*background_validation_millis*]
#   The background-validation-millis element specifies the amount of time, in milliseconds, that background validation will run. Changing this value can be done only on disabled datasource,  requires a server restart otherwise
#
# [*blocking_timeout_wait_millis*]
#   The blocking-timeout-millis element specifies the maximum time, in milliseconds, to block while waiting for a connection before throwing an exception. Note that this blocks only while waiting for locking a connection, and will never throw an exception if creating a new connection takes an inordinately long time
#
# [*check_valid_connection_sql*]
#   Specify an SQL statement to check validity of a pool connection. This may be called when managed connection is obtained from the pool
#
# [*connection_url*]
#   The JDBC driver connection URL
#
# [*datasource_class*]
#   The fully qualified name of the JDBC datasource class
#
# [*driver_class*]
#   The fully qualified name of the JDBC driver class
#
# [*driver_name*]
#   Defines the JDBC driver the datasource should use. It is a symbolic name matching the the name of installed driver. In case the driver is deployed as jar, the name is the name of deployment unit
#
# [*enabled*]
#   Specifies if the datasource should be enabled
#
# [*exception_sorter_class_name*]
#   An org.jboss.jca.adapters.jdbc.ExceptionSorter that provides an isExceptionFatal(SQLException) method to validate if an exception should broadcast an error
#
# [*exception_sorter_properties*]
#   The exception sorter properties
#
# [*flush_strategy*]
#   Specifies how the pool should be flush in case of an error. Valid values are: FailingConnectionOnly (default), IdleConnections and EntirePool
#
# [*idle_timeout_minutes*]
#   The idle-timeout-minutes elements specifies the maximum time, in minutes, a connection may be idle before being closed. The actual maximum time depends also on the IdleRemover scan time, which is half of the smallest idle-timeout-minutes value of any pool. Changing this value can be done only on disabled datasource, requires a server restart otherwise.
#
# [*jndi_name*]
#   Specifies the JNDI name for the datasource
#
# [*jta*]
#   Enable JTA integration
#
# [*max_pool_size*]
#   The max-pool-size element specifies the maximum number of connections for a pool. No more connections will be created in each sub-pool
#
# [*min_pool_size*]
#   The min-pool-size element specifies the minimum number of connections for a pool
#
# [*new_connection_sql*]
#   Specifies an SQL statement to execute whenever a connection is added to the connection pool
#
# [*password*]
#   Specifies the password used when creating a new connection
#
# [*pool_prefill*]
#   Should the pool be prefilled. Changing this value can be done only on disabled datasource, requires a server restart otherwise.
#
# [*pool_use_strict_min*]
#   Specifies if the min-pool-size should be considered strictly
#
# [*prepared_statements_cache_size*]
#   The number of prepared statements per connection in an LRU cache
#
# [*query_timeout*]
#   Any configured query timeout in seconds. If not provided no timeout will be set
#
# [*reauth_plugin_class_name*]
#   The fully qualified class name of the reauthentication plugin implementation
#
# [*reauth_plugin_properties*]
#   The properties for the reauthentication plugin
#
# [*security_domain*]
#   Specifies the security domain which defines the javax.security.auth.Subject that are used to distinguish connections in the pool
#
# [*set_tx_query_timeout*]
#   Whether to set the query timeout based on the time remaining until transaction timeout. Any configured query timeout will be used if there is no transaction
#
# [*share_prepared_statements*]
#   Whether to share prepared statements, i.e. whether asking for same statement twice without closing uses the same underlying prepared statement
#
# [*spy*]
#   Enable spying of SQL statements
#
# [*stale_connection_checker_class_name*]
#   An org.jboss.jca.adapters.jdbc.StaleConnectionChecker that provides an isStaleConnection(SQLException) method which if it returns true will wrap the exception in an org.jboss.jca.adapters.jdbc.StaleConnectionException
#
# [*stale_connection_checker_properties*]
#   The stale connection checker properties
#
# [*track_statements*]
#   Whether to check for unclosed statements when a connection is returned to the pool, result sets are closed, a statement is closed or return to the prepared statement cache. Valid values are: "false" - do not track statements, "true" - track statements and result sets and warn when they are not closed, "nowarn" - track statements but do not warn about them being unclosed
#
# [*transaction_isolation*]
#   Set the java.sql.Connection transaction isolation level. Valid values are: TRANSACTION_READ_UNCOMMITTED, TRANSACTION_READ_COMMITTED, TRANSACTION_REPEATABLE_READ, TRANSACTION_SERIALIZABLE and TRANSACTION_NONE
#
# [*url_delimiter*]
#   Specifies the delimiter for URLs in connection-url for HA datasources
#
# [*url_selector_strategy_class_name*]
#   A class that implements org.jboss.jca.adapters.jdbc.URLSelectorStrategy
#
# [*use_ccm*]
#   Enable the use of a cached connection manager
#
# [*use_fast_fail*]
#   Whether to fail a connection allocation on the first try if it is invalid (true) or keep trying until the pool is exhausted of all potential connections (false)
#
# [*use_java_context*]
#   Setting this to false will bind the datasource into global JNDI
#
# [*use_try_lock*]
#   Any configured timeout for internal locks on the resource adapter objects in seconds
#
# [*user_name*]
#   Specify the user name used when creating a new connection
#
# [*valid_connection_checker_class_name*]
#   An org.jboss.jca.adapters.jdbc.ValidConnectionChecker that provides an isValidConnection(Connection) method to validate a connection. If an exception is returned that means the connection is invalid. This overrides the check-valid-connection-sql element
#
# [*valid_connection_checker_properties*]
#   The valid connection checker properties
#
# [*validate_on_match*]
#   The validate-on-match element specifies if connection validation should be done when a connection factory attempts to match a managed connection. This is typically exclusive to the use of background validation
#
#
define jboss_admin::resource::data_source (
  $server,
  $allocation_retry               = undef,
  $allocation_retry_wait_millis   = undef,
  $background_validation          = undef,
  $background_validation_millis   = undef,
  $blocking_timeout_wait_millis   = undef,
  $check_valid_connection_sql     = undef,
  $connection_url                 = undef,
  $datasource_class               = undef,
  $driver_class                   = undef,
  $driver_name                    = undef,
  $enabled                        = undef,
  $exception_sorter_class_name    = undef,
  $exception_sorter_properties    = undef,
  $flush_strategy                 = undef,
  $idle_timeout_minutes           = undef,
  $jndi_name                      = undef,
  $jta                            = undef,
  $max_pool_size                  = undef,
  $min_pool_size                  = undef,
  $new_connection_sql             = undef,
  $password                       = undef,
  $pool_prefill                   = undef,
  $pool_use_strict_min            = undef,
  $prepared_statements_cache_size = undef,
  $query_timeout                  = undef,
  $reauth_plugin_class_name       = undef,
  $reauth_plugin_properties       = undef,
  $security_domain                = undef,
  $set_tx_query_timeout           = undef,
  $share_prepared_statements      = undef,
  $spy                            = undef,
  $stale_connection_checker_class_name = undef,
  $stale_connection_checker_properties = undef,
  $track_statements               = undef,
  $transaction_isolation          = undef,
  $url_delimiter                  = undef,
  $url_selector_strategy_class_name = undef,
  $use_ccm                        = undef,
  $use_fast_fail                  = undef,
  $use_java_context               = undef,
  $use_try_lock                   = undef,
  $user_name                      = undef,
  $valid_connection_checker_class_name = undef,
  $valid_connection_checker_properties = undef,
  $validate_on_match              = undef,
  $ensure                         = present,
  $path                           = $name
) {
  if $ensure == present {

    if $allocation_retry != undef and !is_integer($allocation_retry) { 
      fail('The attribute allocation_retry is not an integer') 
    }
    if $connection_url == undef { fail('The attribute connection_url is undefined but required') }
    if $driver_name == undef { fail('The attribute driver_name is undefined but required') }
    if $jndi_name == undef { fail('The attribute jndi_name is undefined but required') }
    if $max_pool_size != undef and !is_integer($max_pool_size) { 
      fail('The attribute max_pool_size is not an integer') 
    }
    if $min_pool_size != undef and !is_integer($min_pool_size) { 
      fail('The attribute min_pool_size is not an integer') 
    }
  

    $raw_options = { 
      'allocation-retry'             => $allocation_retry,
      'allocation-retry-wait-millis' => $allocation_retry_wait_millis,
      'background-validation'        => $background_validation,
      'background-validation-millis' => $background_validation_millis,
      'blocking-timeout-wait-millis' => $blocking_timeout_wait_millis,
      'check-valid-connection-sql'   => $check_valid_connection_sql,
      'connection-url'               => $connection_url,
      'datasource-class'             => $datasource_class,
      'driver-class'                 => $driver_class,
      'driver-name'                  => $driver_name,
      'enabled'                      => $enabled,
      'exception-sorter-class-name'  => $exception_sorter_class_name,
      'exception-sorter-properties'  => $exception_sorter_properties,
      'flush-strategy'               => $flush_strategy,
      'idle-timeout-minutes'         => $idle_timeout_minutes,
      'jndi-name'                    => $jndi_name,
      'jta'                          => $jta,
      'max-pool-size'                => $max_pool_size,
      'min-pool-size'                => $min_pool_size,
      'new-connection-sql'           => $new_connection_sql,
      'password'                     => $password,
      'pool-prefill'                 => $pool_prefill,
      'pool-use-strict-min'          => $pool_use_strict_min,
      'prepared-statements-cache-size' => $prepared_statements_cache_size,
      'query-timeout'                => $query_timeout,
      'reauth-plugin-class-name'     => $reauth_plugin_class_name,
      'reauth-plugin-properties'     => $reauth_plugin_properties,
      'security-domain'              => $security_domain,
      'set-tx-query-timeout'         => $set_tx_query_timeout,
      'share-prepared-statements'    => $share_prepared_statements,
      'spy'                          => $spy,
      'stale-connection-checker-class-name' => $stale_connection_checker_class_name,
      'stale-connection-checker-properties' => $stale_connection_checker_properties,
      'track-statements'             => $track_statements,
      'transaction-isolation'        => $transaction_isolation,
      'url-delimiter'                => $url_delimiter,
      'url-selector-strategy-class-name' => $url_selector_strategy_class_name,
      'use-ccm'                      => $use_ccm,
      'use-fast-fail'                => $use_fast_fail,
      'use-java-context'             => $use_java_context,
      'use-try-lock'                 => $use_try_lock,
      'user-name'                    => $user_name,
      'valid-connection-checker-class-name' => $valid_connection_checker_class_name,
      'valid-connection-checker-properties' => $valid_connection_checker_properties,
      'validate-on-match'            => $validate_on_match,
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