# install nginx using puppet

package { 'nginx':
  ensure  => 'present',
}

exec { 'root':
  provider => shell,
  command  => 'sudo echo Hello World! > /var/www/html/index.html',
}

exec { 'redirect':
  provider => shell,
  command  => 'sudo echo "server { listen 80; server_name localhost; \
  location / { root /var/www/html; index index.html; } }" \
  > /etc/nginx/sites-available/default',
}

exec { 'restart':
  provider => shell,
  command  => 'sudo systemctl restart nginx',
}
