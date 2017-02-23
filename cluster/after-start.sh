#!/bin/sh -e
echo Init the system

./sup crossbar_maintenance create_account admin kamailio.kazoo admin admin
./sup ecallmgr_maintenance add_fs_node freeswitch@freeswitch.zone1
./sup ecallmgr_maintenance add_fs_node freeswitch@freeswitch.zone2
./sup kazoo_media_maintenance import_prompts /home/user/kazoo-sounds/kazoo-core/en/us en-us

docker cp monster-ui.kazoo:/usr/share/nginx/html/src/apps apps
docker cp apps kazoo.zone1:/home/user
rm -rf apps

./sup crossbar_maintenance init_apps /home/user/apps http://kazoo.kazoo:8000/v2

docker exec -ti kamailio.kazoo kamctl dispatcher reload 
