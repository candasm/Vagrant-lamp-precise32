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