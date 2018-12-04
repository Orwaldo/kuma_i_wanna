#!/bin/zsh

sudo apt-get install apt-transport-https lsb-release ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list
sudo apt-get update

apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert

apt-get install php7.2 php7.2-opcache libapache2-mod-php7.2 php7.2-mysql php7.2-curl php7.2-json php7.2-gd  php7.2-intl php7.2-mbstring php7.2-xml php7.2-zip php7.2-fpm php7.2-readline

service apache2 restart

a2enmod proxy_fcgi setenvif
a2enconf php7.2-fpm
a2dismod php7.2

service apache2 restart
service php7.2-fpm restart
