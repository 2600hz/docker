#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
NAME=makebusy.kazoo
docker stop $NAME
docker rm $NAME
docker run $FLAGS --privileged  -v /sys/fs/cgroup:/sys/fs/cgroup:ro --net kazoo -h $NAME --name $NAME kazoo/makebusy
docker exec -ti $NAME build/run.sh
docker exec -ti $NAME build/setup-ip.sh

