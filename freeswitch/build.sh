#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
docker build $BUILD_ALL $BUILD_FREESWITCH -t $NETWORK/freeswitch .
