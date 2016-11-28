#!/bin/bash
COUCH=$(../bin/get-ip couchdb.kazoo)
ACCID=$(curl -s http://$COUCH:15984/accounts/_design/accounts/_view/listing_by_name | jq -r .rows[0].id)
curl -s http://$COUCH:15984/accounts/$ACCID | jq -r .pvt_api_key

