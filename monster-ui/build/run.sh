#!/bin/sh

cp etc/config-kazoo.js /var/www/html/kazoo-ui/config/config.js
cp etc/config-monster-ui.js /var/www/html/monster-ui/js/config.js

nginx -g "daemon off;"
