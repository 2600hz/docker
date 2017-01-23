#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
docker build $BUILD_FLAGS -t $NETWORK/couchdb .
