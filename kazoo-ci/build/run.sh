#!/bin/sh
IP=$(hostname -i)
export PHPRC=./php.ini
mkdir -p /run/apache2
sed -i 's|^DocumentRoot.*|DocumentRoot /home/user/make-busy/ci|' /etc/apache2/httpd.conf
sed -i 's|^User.*|User user|' /etc/apache2/httpd.conf
sed -i "s|^#ServerName.*|ServerName $IP|" /etc/apache2/httpd.conf
exec /usr/sbin/httpd -DFOREGROUND
