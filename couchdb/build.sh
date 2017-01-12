#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
docker build $BUILD_ALL $BUILD_COUCHDB -t $NETWORK/couchdb .
