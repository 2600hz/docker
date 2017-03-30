#!/bin/sh -e
FLAGS=${1:-"-td"}
IMAGE=${2:-"kazoo/couchdb"}
NETWORK=${NETWORK:-"kazoo"}
NAME=couchdb.$NETWORK

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi
echo -n "starting: $NAME "

docker run $FLAGS \
	--net $NETWORK \
	-h $NAME \
	--name $NAME \
	$IMAGE
