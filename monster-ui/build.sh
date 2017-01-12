#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}
REPO=${2:-"https://github.com/2600hz/monster-ui.git"}
echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
docker build $BUILD_ALL $BUILD_MONSTER -t $NETWORK/monster-ui --build-arg REPO=$REPO .
