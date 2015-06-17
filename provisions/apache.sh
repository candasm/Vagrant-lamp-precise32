#!/usr/bin/env bash

echo '========================================================='
echo "Apache2.4 Install"

apt-get install -y apache2 openssl
a2enmod ssl rewrite

#create ssl certificate
mkdir -p /etc/apache2/ssl
echo ">> apache2 ssl folder created"
openssl genrsa -des3 -passout pass:1234 -out server.key 1024
echo ">> server.key created"
openssl req \
        -new \
        -key server.key \
        -passin pass:1234 \
        -subj "/C=TR/ST=Turkey/L=Istanbul/O=Dev/CN=localhost/emailAddress=info@localhost" \
        -out server.csr
echo ">> server.csr certificate created"
openssl x509 \
        -req \
        -days 365 \
        -in server.csr \
        -passin pass:1234 \
        -signkey server.key \
        -out server.crt
echo ">> server.crt certificate created"
mv {server.key,server.csr,server.crt} /etc/apache2/ssl
echo ">> {server.key,server.csr,server.crt} files moved under /etc/apache2/ssl"

#apache settings
rm -rf /var/www
ln -fs /vagrant/public /var/www

sudo sed -i '/export APACHE_RUN_USER=www-data/c export APACHE_RUN_USER=vagrant' /etc/apache2/envvars
sudo sed -i '/export APACHE_RUN_GROUP=www-data/c export APACHE_RUN_GROUP=vagrant' /etc/apache2/envvars
echo ">> apache vagrant users setted"
rm -rf /etc/apache2/sites-available/*
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
echo ">> apache2 config files added"
echo ">> apache2 installed and setted"