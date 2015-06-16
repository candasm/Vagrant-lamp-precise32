#!/usr/bin/env bash

mkdir /vagrant/.vagrant/log /vagrant/.vagrant/log/provisions

echo '========================================================='
echo "system update..."
    apt-get update
	export LC_CTYPE="tr_TR.UTF-8"
	echo 'export LC_CTYPE="tr_TR.UTF-8"' >> ~/.bash_profile
	apt-get install -y build-essential python-software-properties curl vim git
echo '========================================================='