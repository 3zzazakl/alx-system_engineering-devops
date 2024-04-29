#!/usr/bin/env bash
# installing mysql server

sudo service mysql stop
sudo apt-get remove --purge mysql-server mysql-client mysql-common -y && sudo apt-get autoremove -y
sudo rm -rf /etc/apt/sources.list.d/mysql.list*
sudo rm -rf /var/lib/mysql-apt-config
sudo dpkg --purge mysql-apt-config
dpkg -l | grep mysql
sudo rm -rf /etc/mysql /var/lib/mysql
cat /etc/apt/sources.list | grep mysql

sudo apt update
sudo wget -O mysql57 https://raw.githubusercontent.com/nuuxcode/alx-system_engineering-devops/master/scripts/mysql57 && sudo chmod +x mysql57 &&  sudo ./mysql57
sudo service mysql status
mysql --version

