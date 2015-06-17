#!/usr/bin/env bash

echo '========================================================='
echo ">> Mysql database server will start to install"

apt-get install -y debconf-utils
echo ">> debconf-utils yuklemesi tamamlandi"

debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password root"

apt-get install -y mysql-server --fix-missing --fix-broken
echo ">> mysql server yuklemesi tamamlandi"
apt-get install -y php5-mysql
echo ">> php5 mysql paketi yuklendi"
echo "create database default_database CHARACTER SET utf8 COLLATE utf8_general_ci" | mysql -uroot -proot
echo ">> mysql default database olusturuldu"