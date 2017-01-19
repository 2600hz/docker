#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/2600hz/kazoo.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}
SKIP_BUILD=${SKIP_BUILD:-""}
UID=$(id -u)
GID=$(id -g)

echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
docker build $BUILD_ALL $BUILD_KAZOO -t $NETWORK/kazoo \
	--build-arg REPO=$REPO \
	--build-arg SKIP_BUILD=$SKIP_BUILD \
	--build-arg UID=$UID \
	--build-arg GID=$GID \
	.
