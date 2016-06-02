#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
docker stop kazoo-freeswitch
docker rm kazoo-freeswitch
docker run $FLAGS --net kazoo -h kazoo-freeswitch --name kazoo-freeswitch kazoo/freeswitch
