#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
docker run $FLAGS --name kazoo-freeswitch kazoo/freeswitch