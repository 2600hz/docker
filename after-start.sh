#!/bin/sh
echo Init the system

cd kazoo
./sup crossbar_maintenance create_account admin kamailio.kazoo admin admin
./sup ecallmgr_maintenance add_fs_node freeswitch@freeswitch.kazoo
./sup kazoo_media_maintenance import_prompts /home/user/kazoo-sounds/kazoo-core/en/us en-us

docker cp monster-ui.kazoo:/usr/share/nginx/html/apps apps
docker cp apps kazoo.kazoo:/home/user
rm -rf apps

./sup crossbar_maintenance init_apps /home/user/apps http://kazoo.kazoo:8000/v2

docker exec -ti kamailio.kazoo kamctl dispatcher reload 
