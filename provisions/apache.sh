#!/usr/bin/env bash

echo '========================================================='
echo "Apache2.4 Install"

apt-get install -y apache2 openssl
a2enmod ssl rewrite

#create ssl certificate
mkdir -p /etc/apache2/ssl
echo ">> apache2 ssl folder created"

sudo openssl req \
             -x509 \
             -nodes \
             -days 365 \
             -newkey \
             rsa:2048 \
             -subj "/C=TR/ST=Turkey/L=Istanbul/O=Dev/CN=localhost/emailAddress=info@localhost" \
             -keyout /etc/apache2/ssl/apache.key \
             -out /etc/apache2/ssl/apache.crt

echo ">> apache.key, apache.crt  self signed certificates created under /etc/apache2/ssl"

#apache settings
rm -rf /var/www
ln -fs /vagrant/public /var/www

sudo sed -i '/export APACHE_RUN_USER=www-data/c export APACHE_RUN_USER=vagrant' /etc/apache2/envvars
sudo sed -i '/export APACHE_RUN_GROUP=www-data/c export APACHE_RUN_GROUP=vagrant' /etc/apache2/envvars
echo ">> apache vagrant users setted"
rm -rf /etc/apache2/sites-available/*
rm -rf /etc/apache2/sites-enabled/*
cat >> /etc/apache2/sites-available/localhost.conf <<EOF
<VirtualHost *:80>
        DocumentRoot /var/www
        <Directory />
                Options FollowSymLinks
                AllowOverride All
        </Directory>
        <Directory /var/www/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>
</VirtualHost>
EOF
cat >> /etc/apache2/sites-available/localhost-ssl.conf <<EOF
<VirtualHost *:443>
     SSLEngine On
     SSLCertificateFile /etc/apache2/ssl/server.pem
     SSLCertificateKeyFile /etc/apache2/ssl/server.key
     DocumentRoot /var/www
     ServerName localhost
        <Directory />
                Options FollowSymLinks
                AllowOverride All
        </Directory>
        <Directory /var/www/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>
</VirtualHost>
EOF
ln -ls /etc/apache2/sites-available/localhost.conf /etc/apache2/sites-enabled/localhost.conf
ln -ls /etc/apache2/sites-available/localhost-ssl.conf /etc/apache2/sites-enabled/localhost-ssl.conf
echo ">> apache2 config files added"
echo ">> apache2 installed and setted"