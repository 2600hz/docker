#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=couchdb2.$NETWORK
docker stop $NAME
docker rm $NAME
docker run $FLAGS --net $NETWORK -h $NAME --name $NAME kazoo/couchdb2
