#!/bin/sh

cp etc/config-monster-ui.js $WWW/html/src/js/config.js
cd $WWW/html
gulp
