#!/bin/sh
cd ../kazoo
./run.sh
cd ../couchdb
./run-init.sh
echo Waiting for kazoo to start
watch -g "docker logs kazoo.kazoo | grep 'auto-started kapps'" > /dev/null

