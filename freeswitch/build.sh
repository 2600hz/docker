#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://freeswitch.org/stash/scm/fs/freeswitch.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo $COMMIT > etc/commit

docker build $BUILD_FLAGS --build-arg REPO=$REPO -t $NETWORK/freeswitch .
