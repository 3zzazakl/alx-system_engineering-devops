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
  line   => 'add-header X-Served-By @hostname;',
  match  => '^\s*location / {',
}

exec { 'restarting':
  command  => 'sudo service nginx restart',
  provider => shell,
}
