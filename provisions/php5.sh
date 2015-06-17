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
                   php5-xmlrpc \
                   php5-pspell \
                   php5-curl
pear config-set auto_discover 1
echo ">> php paketleri kuruldu"

sed -i '/display_errors = Off/c display_errors = On' /etc/php5/apache2/php.ini
sed -i '/display_errors = Off/c display_errors = On' /etc/php5/cli/php.ini
sed -i '/;date.timezone =/c date.timezone ="Europe/Istanbul"' /etc/php5/apache2/php.ini
sed -i '/;date.timezone =/c date.timezone ="Europe/Istanbul"' /etc/php5/cli/php.ini

echo ">> php.ini ayarlari timezone ve display error ayarlari eklendi"

pecl install xdebug
cat >> /etc/php5/apache2/conf.d/xdebug.ini <<EOF
[xdebug]
zend_extension="/usr/lib/php5/20121212/xdebug.so"
xdebug.remote_enable=on
xdebug.remote_log="/var/log/xdebug.log"
xdebug.remote_host=localhost
xdebug.remote_handler=dbgp
xdebug.remote_port=9000
xdebug.remote_connect_back = on
EOF
echo ">> xdebug yuklendi ve config dosyasi /etc/php5/apache2/conf.d/xdebug.ini adrese eklendi"
