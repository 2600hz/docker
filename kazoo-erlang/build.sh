#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
docker build $BUILD_ALL $BUILD_ERLANG -t $NETWORK/erlang .
