exec { 'update':
  command  => 'sudo apt update -y',
  provider => shell,
}
-> package { 'nginx':
  ensure   => present,
}
-> file_line { 'header':
  ensure => present,
  path   => '/etc/nginx/site-available/default',
  after  => 'server_name _;'
  line   => "add_header X-Served-By \"${hostname}\";",
}
-> exec { 'restarting':
  command  => 'sudo service nginx restart',
  provider => shell,
}
