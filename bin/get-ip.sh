#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
if [ "$1" = "" ]
then
	echo Usage: $0 container
	exit
fi

docker inspect --format "{{ .NetworkSettings.Networks.$NETWORK.IPAddress }}" $1
