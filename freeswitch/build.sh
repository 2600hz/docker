#!/bin/sh -e

NETWORK=${NETWORK:-'kazoo'}
REPO=${2:-'https://freeswitch.org/stash/scm/fs/freeswitch.git'}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

docker build $BUILD_FLAGS \
       --build-arg NETWORK=$NETWORK \
       --build-arg REPO=$REPO \
       --build-arg FREESWITCH_COMMIT=$COMMIT \
       -t $NETWORK/freeswitch .
