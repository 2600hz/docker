#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
docker stop kazoo-kamailio
docker rm kazoo-kamailio
docker run $FLAGS --net kazoo --name kazoo-kamailio kazoo/kamailio
