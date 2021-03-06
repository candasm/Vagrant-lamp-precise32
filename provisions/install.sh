#!/usr/bin/env bash
sudo su
cd /vagrant/provisions/
systemLogRoot="/vagrant/.vagrant/log/provisions"

#scripts
if [ ! -f "$systemLogRoot/systemSetup" ];
then
    bash ./system.sh
    touch "$systemLogRoot/systemSetup"
fi

if [ ! -f "$systemLogRoot/apacheSetup" ];
then
    bash ./apache.sh
    touch "$systemLogRoot/apacheSetup"
fi

if [ ! -f "$systemLogRoot/phpSetup" ];
then
    bash ./php5.sh
    touch "$systemLogRoot/phpSetup"
fi

if [ ! -f "$systemLogRoot/mysqlSetup" ];
then
    bash ./mysql.sh
    touch "$systemLogRoot/mysqlSetup"
fi

if [ -f /var/log/apacheSetup ];
then
	service apache2 restart
fi
if [ -f /var/log/mysqlSetup ];
then
	service mysql restart
fi