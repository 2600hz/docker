#!/bin/sh
cd ../kazoo
./run.sh
cd ../couchdb
./run.sh -td kazoo/couchdb-init-mkbs
echo 'Waiting for kazoo to start (you may check docker logs if impatient)'
watch -g "docker logs kazoo.kazoo | grep 'auto-started kapps'" > /dev/null
cd ../makebusy
./setup-kazoo.sh
