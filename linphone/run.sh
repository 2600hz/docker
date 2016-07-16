#!/bin/sh
ID=$1
TARGET=$2
: ${ID:=1}
: ${TARGET:=company.kazoo}
KAMAILIO_IP=`../bin/get-ip kamailio.kazoo`
echo Linphone $ID for $TARGET as $KAMAILIO_IP
NAME=linphone$ID.kazoo
docker stop $NAME
docker rm $NAME
docker run -td $ARGS \
	--add-host=$TARGET:$KAMAILIO_IP \
	--net kazoo \
	-h $NAME --name $NAME \
	-v /dev/snd:/dev/snd \
	--privileged \
	kazoo/linphone
