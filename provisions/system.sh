#!/usr/bin/env bash

mkdir /vagrant/.vagrant/log /vagrant/.vagrant/log/provisions

echo '========================================================='
echo "system update..."
    echo "Europe/Istanbul" | sudo tee /etc/timezone
    dpkg-reconfigure --frontend noninteractive tzdata
    echo "ondrej/php5 repository added"
    add-apt-repository ppa:ondrej/php5 -y
    apt-get update
    locale-gen tr_TR.UTF-8
	export LC_CTYPE="tr_TR.UTF-8"
	echo 'export LC_CTYPE="tr_TR.UTF-8"' >> ~/.bash_profile
	apt-get install -y build-essential python-software-properties curl vim git
echo '========================================================='