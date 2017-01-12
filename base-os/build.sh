#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
docker build $BUILD_ALL $BUILD_BASE -t $NETWORK/base-os .
