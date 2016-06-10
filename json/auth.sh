#!/bin/sh
LOGIN=${1:-admin}
PASS=${2:-admin}
AUTH=$(echo -n $LOGIN:$PASS | md5sum | cut -f 1 -d " ")

DATA="{\"data\":{\"credentials\":\"$AUTH\",\"account_name\":\"admin_name\",\"ui_metadata\":{\"ui\":\"kazoo-ui\"}},\"verb\":\"PUT\"}"
curl -v -XPUT -d $DATA -H "Content-Type: application/json" \
	http://localhost:8000/v1/user_auth 
