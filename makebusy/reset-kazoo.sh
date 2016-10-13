#!/bin/sh
docker stop kazoo.kazoo
cd ../couchdb
./run-init.sh
docker start kazoo.kazoo
