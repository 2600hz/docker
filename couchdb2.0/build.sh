#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
docker build $1 -t $NETWORK/couchdb2 .
