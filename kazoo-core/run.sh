#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=${NAME:-"core.$NETWORK"}
docker stop -t 1 $NAME
docker rm -f $NAME
docker run $FLAGS \
	--net $NETWORK \
	-h $NAME \
	--name $NAME \
	--env RABBITMQ=${RABBITMQ:-"rabbitmq.$NETWORK"} \
	-v /opt/projects/github/2600hz/kazoo:/opt/kazoo \
	kazoo/core
