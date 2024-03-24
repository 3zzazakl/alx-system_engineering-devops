# install nginx using puppet

package { 'nginx':
  ensure  => 'present',
}

exec { 'root':
  provider => shell,
  command  => 'echo Hello World! | sudo tee /var/www/html/index.html',
}

exec { 'redirect':
  provider => shell,
  command  =>
    'sudo sed -i "s/listen 80 default_server;/listen 80 default_server;\\n\\tlocation \\/redirect_me {\\n\\t\\treturn 301 http:\/\/www.google.com\\/;\\n\\t}/" /etc/nginx/sites-available/default',
}

exec { 'restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
