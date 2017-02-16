#!/bin/sh
CFG=/usr/share/nginx/html/js/config.js
sed -i "s|http://kazoo.deploy:8000/v2/|$KAZOO_URL|" $CFG
exec /usr/sbin/nginx -g "daemon off;"
