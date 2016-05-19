#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
docker stop kazoo-monster-ui
docker rm kazoo-monster-ui
docker run $FLAGS --net kazoo --name kazoo-monster-ui kazoo/monster-ui
