#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y
sudo apt-get install libapache2-mod-php7.0 php7.0 php7.0-common php7.0-curl php7.0-dev php7.0-gd php-pear php7.0-mcrypt php7.0-mysql -y
sudo apt-get install mysql-server mysql-client -y

sudo chown -R www-data:www-data /var/www

sudo a2enmod rewrite
sudo phpenmod mcrypt

sudo service apache2 restart

exit 0
