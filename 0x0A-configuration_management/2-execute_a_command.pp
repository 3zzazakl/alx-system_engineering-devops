# Using Puppet, create a manifest that kills a process named killmenow
# and ensures that it is not running.
exec { 'kill_process':
  command     => '/usr/bin/pkill killmenow',
  refreshonly => true,
  logoutput   => true,
}
