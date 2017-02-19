#!/bin/sh -e
if [ -z $1 ]
then
	echo Usage: $0 access_token
	exit
fi
NAME=kazoo-ci

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
echo -n "stopping: "
	docker stop -t 1 $NAME
	echo -n "removing: "
	docker rm -f $NAME
fi

echo -n "mounting: "
docker run -v kazoo-ci:/home/user/volume --user root --entrypoint ./volume.sh kazoo/ci

echo -n "starting: $NAME "
docker run \
	 --restart unless-stopped \
	-h $NAME \
	--name $NAME \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v kazoo-ci:/home/user/volume \
	-p 80:80 \
	-e HOME=/home/user \
	-e TOKEN=$1 \
	-td kazoo/ci
