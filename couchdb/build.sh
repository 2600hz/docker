#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
docker build $BUILD_FLAGS -t $NETWORK/couchdb .
