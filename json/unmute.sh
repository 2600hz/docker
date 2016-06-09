#!/bin/sh
curl -s -X POST -H "Accept: application/json" -H "Content-Type: application/json" -H "X-Auth-Token: $AUTH" \
	http://localhost:8000/v1/accounts/$ACC/conferences/$CONF?action=unmute\&participant=$1 \
	| jq '.'
