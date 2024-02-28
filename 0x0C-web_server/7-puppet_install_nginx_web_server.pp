# install nginx using puppet

package { 'nginx':
  ensure  => 'installed',
}

file { '/var/www/html/index.html':
  require => package['nginx'],
  content => 'Hello, World!',
}

file_line {'parse':
  ensure  => present,
  line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  path    => '/etc/nginx/sites-available/default',
  require => package['nginx'],
  after   => 'root /var/www/html;'
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure  => running,
  require => File_line['parse'],
}
