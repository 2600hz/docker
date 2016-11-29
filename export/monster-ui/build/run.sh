#!/bin/sh
CFG=/usr/share/nginx/html/js/config.js
sed -i "s|kazoo.kazoo|$KAZOO|" $CFG
/usr/sbin/nginx -g "daemon off;"
