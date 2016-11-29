#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
BUILD_ARG=${1:-""}
REPO=${2:-"https://github.com/2600hz/kazoo.git"}
COMMIT=${3:-"$(../bin/get-commit $REPO)"}
echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
docker build $BUILD_ARG -t $NETWORK/kazoo --build-arg REPO=$REPO --build-arg COMMIT=$COMMIT .
