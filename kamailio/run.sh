#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=${NAME:-"kamailio.$NETWORK"}
docker stop -t 1 $NAME
docker rm -f $NAME
docker run $FLAGS \
	--net $NETWORK \
	-h $NAME \
	--name $NAME \
	--env RABBITMQ=${RABBITMQ:-"rabbitmq.$NETWORK"} \
	kazoo/kamailio

if [ -n "$FREESWITCH" ]
then
	echo Adding dispatcher $FREESWITCH to Kamailio
	docker exec $NAME dispatcher_add.sh 1 $FREESWITCH
else
	echo No dispatcher added, please add manually.
fi
