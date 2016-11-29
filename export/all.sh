#!/bin/bash
docker rmi $(docker images | grep "2600hz/" | cut -d' ' -f 1)
cd export/couchdb
./build.sh
cd ../rabbitmq
./build.sh
cd ../kazoo
./extract.sh kazoo.$NETWORK
./build.sh
cd ../kamailio
./extract.sh kamailio.$NETWORK
./build.sh
cd ../freeswitch
./extract.sh freeswitch.$NETWORK
./build.sh
cd ../monster-ui
./extract.sh monster-ui.$NETWORK
./build.sh
cd ../
docker push 2600hz/couchdb
docker push 2600hz/rabbitmq
docker push 2600hz/kazoo
docker push 2600hz/kamailio
docker push 2600hz/freeswitch
docker push 2600hz/monster-ui
