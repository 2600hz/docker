#!/bin/sh -e
REPO=${2:-"https://github.com/2600hz/kazoo.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

BRANCH=${BRANCH:-""}
SKIP_BUILD=${SKIP_BUILD:-""}
NETWORK=${NETWORK:-"kazoo"}

KZUID=$(id -u)
GID=$(id -g)

echo Using repository:$REPO commit:$COMMIT branch:$BRANCH
echo $COMMIT > etc/commit
docker build $BUILD_FLAGS -t $NETWORK/kazoo \
	--build-arg REPO=$REPO \
	--build-arg SKIP_BUILD=$SKIP_BUILD \
	--build-arg KZUID=$KZUID \
	--build-arg GID=$GID \
	--build-arg BRANCH=$BRANCH \
	.
