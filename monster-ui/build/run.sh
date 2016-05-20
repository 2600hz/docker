#!/bin/sh

cp etc/config-monster-ui.js $WWW/html/js/config.js

nginx -g "daemon off;"
