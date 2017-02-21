#!/bin/sh -e

NETWORK=${NETWORK:-'kazoo'}

docker build $BUILD_FLAGS \
       --build-arg NETWORK=$NETWORK \
       -t $NETWORK/base-os .
