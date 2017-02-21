#!/bin/sh -e

NETWORK=${NETWORK:-'kazoo'}
REPO=${2:-'https://github.com/kamailio/kamailio.git'}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

docker build $BUILD_FLAGS \
       --build-arg NETWORK=$NETWORK \
       --build-arg REPO=$REPO \
       --build-arg KAMAILIO40_COMMIT=$COMMIT \
       -t $NETWORK/kamailio .
