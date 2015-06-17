#!/usr/bin/env bash

cd /vagrant/provisions
systemLogRoot="/vagrant/.vagrant/log/provisions"


if [ -f "$systemLogRoot/systemSetup" ];
then
    echo "uninstalling system setup"
    apt-get autoremove -y build-essential python-software-properties curl vim git
    rm -rf "$systemLogRoot/systemSetup"
fi

if [ -f "$systemLogRoot/apacheSetup" ];
then
    echo "uninstalling apache setup"

    apt-get autoremove -y apache2 \
                          openssl
    rn -rf /var/www
    mkdir /var/www

    rm -rf "$systemLogRoot/apacheSetup"
fi

if [ -f "$systemLogRoot/phpSetup" ];
then
    echo "uninstalling php5 setup"

    apt-get autoremove -y php5 \
                       php5-fpm \
                       libapache2-mod-php5 \
                       php-apc \
                       php5-dev \
                       php-pear \
                       php5-mcrypt \
                       php5-cli \
                       php5-gd \
                       php5-intl \
                       php5-mysql \
                       php5-xmlrpc \
                       php5-pspell \
                       php5-curl

    rm -rf "$systemLogRoot/phpSetup"
fi

if [ -f "$systemLogRoot/mysqlSetup" ];
then
    echo "uninstalling mysql setup"


    rm -rf "$systemLogRoot/mysqlSetup"
fi