#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/2600hz/kazoo.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}
echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
docker build $BUILD_ALL $BUILD_KAZOO -t $NETWORK/kazoo --build-arg REPO=$REPO .
