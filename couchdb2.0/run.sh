#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=${NAME:-"couchdb2.$NETWORK"}
docker stop $NAME
docker rm $NAME
docker run $FLAGS \
	--net $NETWORK \
	-h $NAME \
	--name $NAME \
	--env NODENAME=$NAME \
	kazoo/couchdb2
