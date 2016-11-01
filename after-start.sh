#!/bin/sh
echo 'Waiting for kazoo to start (you may check docker logs if impatient)'
watch -g "docker logs kazoo.kazoo | grep 'auto-started kapps'" > /dev/null

echo Init the system
cd kazoo
./sup crossbar_maintenance create_account admin kamailio.kazoo admin admin
./sup ecallmgr_maintenance add_fs_node freeswitch@freeswitch.kazoo

git clone --depth 1 --no-single-branch https://github.com/2600hz/kazoo-sounds
docker cp kazoo-sounds/kazoo-core/en/us kazoo.kazoo:/home/user
./sup kazoo_media_maintenance import_prompts /home/user/us en-us
docker exec -ti --user root kazoo.kazoo rm -rf us

docker cp monster-ui.kazoo:/usr/share/nginx/html/src/apps apps
docker cp apps kazoo.kazoo:/home/user
rm -rf apps
./sup crossbar_maintenance init_apps /home/user/apps http://kazoo.kazoo:8000/v2
docker exec -ti --user root kazoo.kazoo rm -rf apps

docker exec -ti kamailio.kazoo kamctl dispatcher reload 

# save it for future use (e.g. clear things)
docker commit couchdb.kazoo kazoo/couchdb-init
