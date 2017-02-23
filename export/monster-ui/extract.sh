#!/bin/sh -e
CONTAINER=${1:-"monster-ui.kazoo"}
rm -rf monster-ui
docker cp $CONTAINER:/usr/share/nginx/html/dist ./monster-ui
docker cp $CONTAINER:/root/etc/config-monster-ui.js ./monster-ui/js/config.js
cd monster-ui && tar cf ../monster-ui.tar ./ --owner=1000 --group=1000 && cd ../
rm -rf monster-ui
