#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
docker stop kazoo-rabbitmq
docker rm kazoo-rabbitmq
docker run $FLAGS --net kazoo --name kazoo-rabbitmq kazoo/rabbitmq
