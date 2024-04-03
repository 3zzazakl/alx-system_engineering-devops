exec { 'update':
  command  => 'sudo apt update',
  provider => shell,
}

package { 'nginx':
  ensure   => installed,
}

file_line { 'header':
  ensure => present,
  path   => '/etc/nginx/site-available/default',
  line   => 'add_header X-Served-By $HOSTNAME;',
}

exec { 'restarting':
  command  => 'sudo service nginx restart',
  provider => shell,
}
