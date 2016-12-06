#!/bin/sh
NAME=kazoo-ci
docker stop -t 1 $NAME
docker rm -f $NAME
docker run \
   -h $NAME \
   --name $NAME \
	--env HOME=/home/user \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-td kazoo/ci
