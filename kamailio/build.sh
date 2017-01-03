#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
COMMIT=${1:-"HEAD"}
docker build --build-arg=COMMIT=$COMMIT -t $NETWORK/kamailio .
