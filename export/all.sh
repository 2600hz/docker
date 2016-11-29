#!/bin/bash
NETWORK=${1:-"kazoo"}
docker rmi (docker images | grep "\.$NETWORK" | cut -d' ' -f 1)
cd couchdb
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
docker push 2600hz/couchdb
docker push 2600hz/rabbitmq
docker push 2600hz/kazoo
docker push 2600hz/kamailio
docker push 2600hz/freeswitch
