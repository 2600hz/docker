#!/bin/bash

export NETWORK=${NETWORK:-"kazoo"}
ZONES=1
DB_NODES=3
FS_NODES=2

docker network create $NETWORK

for ((n=1;n<=$DB_NODES;n++))
do
  export NAME="db$n.$NETWORK"
  couchdb2.0/run.sh

  until docker exec $NAME curl "http://127.0.0.1:5986" &> /dev/null
  do
  	echo "Waiting for $NAME..."
  	sleep 1
  done

  if [ "$n" -gt "1" ]
  then
	docker exec db1.$NETWORK curl -X PUT "http://127.0.0.1:5986/_nodes/couchdb@$NAME" -d {} &> /dev/null
  fi
done

docker exec db1.$NETWORK curl "http://127.0.0.1:5984/_membership"

for ((n=1;n<=$FS_NODES;n++))
do
  export NAME="fs$n.$NETWORK"
  freeswitch/run.sh
done

export NAME="rb1.$NETWORK"
rabbitmq/run.sh

export NAME="lb1.$NETWORK"
kamailio/run.sh

docker run -it -d -h app1.$NETWORK --name app1.$NETWORK -v /opt/projects/github/2600hz/kazoo:/opt/kazoo kazoo/erlang /opt/kazoo/scripts/dev-start-apps.sh
