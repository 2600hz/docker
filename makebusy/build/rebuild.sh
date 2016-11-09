#!/bin/sh
cd /var/www/html/make-busy
COMMIT=$(cat /root/commit)
git fetch
git reset --hard $COMMIT
