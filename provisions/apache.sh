#!/usr/bin/env bash

echo '========================================================='
echo "Apache2.4 Install"

apt-get install -y apache2
a2enmod ssl rewrite

#todo buraya self signed ssl gelecek

rm -rf /var/www
ln -fs /vagrant/public /var/www

sudo sed -i '/export APACHE_RUN_USER=www-data/c export APACHE_RUN_USER=vagrant' /etc/apache2/envvars
sudo sed -i '/export APACHE_RUN_GROUP=www-data/c export APACHE_RUN_GROUP=vagrant' /etc/apache2/envvars