#!/bin/sh -e
COMMIT=$1
REPO=${2:-"https://github.com/2600hz/kazoo.git"}
NETWORK=${NETWORK:-"kazoo"}
BUILD_FLAGS=${BUILD_FLAGS:-""}
BRANCH=${BRANCH:-""}
echo Using repository $REPO commit:$COMMIT branch:$BRANCH flags:$BUILD_FLAGS
echo $COMMIT > etc/commit
docker build $BUILD_FLAGS \
	-q \
	-t $NETWORK/kazoo \
	--build-arg REPO=$REPO \
	--build-arg BRANCH=$BRANCH \
	.