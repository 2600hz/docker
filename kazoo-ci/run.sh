#!/bin/sh
if [ -z $1 ]
then
	echo Usage: $0 access_token
	exit
fi
NAME=kazoo-ci
docker stop -t 1 $NAME
docker rm -f $NAME
docker run -v kazoo-ci:/home/user/volume --user root --entrypoint ./volume.sh kazoo/ci
docker run \
	-h $NAME \
	--name $NAME \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v kazoo-ci:/home/user/volume \
	-p 80:8080 \
	-e HOME=/home/user \
	-e TOKEN=$1 \
	-td kazoo/ci
