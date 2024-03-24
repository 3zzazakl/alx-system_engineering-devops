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
  command  => 'sudo sed -i "s/80 default_server/80 default_server;\\n\\tlocation \/redirect_me\
  {\\n\\t\\treturn 301 http:\/\/www.google.com;\\n\\t}\\n/g" /etc/nginx/sites-available/default',
}

exec { 'restart':
  provider => shell,
  command  => 'sudo systemctl restart nginx',
}
