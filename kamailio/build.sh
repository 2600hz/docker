#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
COMMIT=${1:-"2250b3e562d6dbcab1477c7ed5a71daa7e462bb9"} # fix version to 4.4.4
docker build $BUILD_ALL $BUILD_KAMAILIO --build-arg=COMMIT=$COMMIT -t $NETWORK/kamailio .
