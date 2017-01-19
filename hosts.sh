#!/bin/sh
NETWORK=${1:-"kazoo"}
for CONTAINER in monster-ui kazoo rabbitmq freeswitch couchdb makebusy makebusy-fs-auth makebusy-fs-pbx makebusy-fs-carrier
do
	if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.$NETWORK)" = "true" ]
	then
		echo `bin/get-ip $CONTAINER.$NETWORK` $CONTAINER.$NETWORK
	fi
done
exit
