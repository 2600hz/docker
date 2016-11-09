#!/bin/sh
cd /var/www/html
git clone git@github.com:2600hz/make-busy.git
cd make-busy
./composer install
cp etc/config.json /var/www/html/make-busy
ln -s /var/www/html/make-busy /root/
