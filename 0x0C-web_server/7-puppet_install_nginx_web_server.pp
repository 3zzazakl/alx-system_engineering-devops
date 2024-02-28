# setting ngix using puppet

exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

package { 'nginx':
  ensure  => present,
  require => Exec['apt-update']
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx']
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello, World!',
  require => Package['nginx']
}

exec { 'redirect_me':
  command  => 'sed -i "24i\rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell',
}
