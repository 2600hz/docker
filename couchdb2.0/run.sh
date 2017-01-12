#!/bin/sh
FLAGS=${1:-"-td"}
IMAGE=${2:-"kazoo/couchdb2"}
NETWORK=${NETWORK:-"kazoo"}
NAME=couchdb2.$NETWORK
docker stop -t 1 $NAME
docker rm -f $NAME
docker run $FLAGS \
	--net $NETWORK \
	-h $NAME \
	--name $NAME \
	$IMAGE
