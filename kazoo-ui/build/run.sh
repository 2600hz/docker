#!/bin/sh

cp etc/config-kazoo.js $WWW/html/config/config.js

nginx -g "daemon off;"
