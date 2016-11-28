#!/bin/bash
ID=$1
TARGET=$2
USERNAME=$3
PASSWORD=$4
if [ "$PASSWORD" = "" ]
then
	echo Usage: $0 container_id target_domain sip_name sip_password
	exit
fi
docker exec -ti linphone$ID.kazoo linphonecsh register --host $TARGET --username $USERNAME --password $PASSWORD
