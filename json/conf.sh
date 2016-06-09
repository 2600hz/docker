#!/bin/bash
curl -s -X GET -H "Accept: application/json" -H "Content-Type: application/json" -H "X-Auth-Token: $AUTH" \
   http://localhost:8000/v1/accounts/$ACC/conferences \
	| jq '.'
