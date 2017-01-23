#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/kamailio/kamailio.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}
echo $COMMIT > etc/commit
docker build $BUILD_FLAGS --build-arg REPO=$REPO -t $NETWORK/kamailio .
