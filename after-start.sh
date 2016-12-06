#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
echo Waiting for kazoo.$NETWORK to start '(you may check docker logs if impatient)'
watch -g "docker logs kazoo.$NETWORK | grep 'auto-started kapps'" > /dev/null

echo Init the system
cd kazoo
./sup crossbar_maintenance create_account admin kamailio.$NETWORK admin admin
./sup ecallmgr_maintenance add_fs_node freeswitch@freeswitch.$NETWORK

git clone --depth 1 --no-single-branch https://github.com/2600hz/kazoo-sounds
docker cp kazoo-sounds/kazoo-core/en/us kazoo.$NETWORK:/home/user
./sup kazoo_media_maintenance import_prompts /home/user/us en-us
docker exec -i --user root kazoo.$NETWORK rm -rf us

docker cp monster-ui.$NETWORK:/usr/share/nginx/html/src/apps apps
docker cp apps kazoo.$NETWORK:/home/user
rm -rf apps
./sup crossbar_maintenance init_apps /home/user/apps http://kazoo.$NETWORK:8000/v2
docker exec -i --user root kazoo.$NETWORK rm -rf apps

docker exec -i kamailio.$NETWORK kamctl dispatcher reload 

# save it for future use (e.g. clear things)
docker commit couchdb.$NETWORK $NETWORK/couchdb-init
cd ../
