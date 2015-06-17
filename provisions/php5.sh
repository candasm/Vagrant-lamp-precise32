#!/usr/bin/env bash

echo '========================================================='
echo ">> Php5.5 will start to install"

apt-get install -y php5 \
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
echo ">> php paketleri kuruldu"