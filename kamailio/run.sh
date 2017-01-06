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
	docker exec $NAME /usr/local/kamailio/sbin/kamctl dispatcher add 1 sip:$FREESWITCH:11000 0 1 ' ' ' '
fi
