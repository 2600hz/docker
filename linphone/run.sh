#!/bin/sh
ID=$1
: ${ID:=1}
NAME=linphone$ID.kazoo
docker stop $NAME
docker rm $NAME
docker run -td --net kazoo -h $NAME --name $NAME kazoo/linphone
