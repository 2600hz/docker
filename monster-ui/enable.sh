#!/bin/bash -e
NETWORK=${NETWORK:-"kazoo"}
echo enable monster-ui applications
docker cp monster-ui.$NETWORK:/usr/share/nginx/html/src/apps apps
docker cp apps kazoo.$NETWORK:/home/user
rm -rf apps
../kazoo/sup crossbar_maintenance init_apps /home/user/apps http://kazoo.$NETWORK:8000/v2
docker exec -i --user root kazoo.$NETWORK rm -rf apps
