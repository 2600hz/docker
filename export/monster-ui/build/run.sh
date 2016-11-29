#!/bin/sh
CFG=/usr/share/nginx/html/js/config.js
sed -i "s|kazoo.kazoo|$KAZOO|" $CFG
exec /usr/sbin/nginx -g "daemon off;"
