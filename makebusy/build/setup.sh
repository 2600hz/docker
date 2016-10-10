#!/bin/sh
cd /var/www/html
git clone git@github.com:2600hz/make-busy.git
rm -rf /etc/freeswitch
ln -s /var/www/html/make-busy/freeswitch /etc/
cd /var/www/html/make-busy
./composer install

