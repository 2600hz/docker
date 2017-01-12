#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}
REPO=${2:-"https://github.com/2600hz/kazoo.git"}
echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
docker build $BUILD_ALL $BUILD_KAZOO -t $NETWORK/kazoo --build-arg REPO=$REPO .
