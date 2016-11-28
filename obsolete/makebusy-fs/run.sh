#!/bin/sh
TYPE=${1:-"auth"}
FLAGS=${2:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=makebusy-fs-$TYPE.$NETWORK
docker stop -t 1 $NAME
docker rm -f $NAME
docker run $FLAGS \
	--restart unless-stopped \
	--net $NETWORK \
	-h $NAME \
	--name $NAME \
	--env TYPE=$TYPE \
	kazoo/makebusy-fs
