# fix server error 

exec { 'replace':
    provider => shell,
    command  => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
    only_if  => 'grep -q "php" /var/www/html/wp-settings.php',
    notify   => 'Restart apache2'
}
