#!/bin/sh
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/2600hz/monster-ui.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}
echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
[ -e ./apps ] && APPS=$(cat apps)
docker build $BUILD_FLAGS \
	-t $NETWORK/monster-ui \
	--build-arg APPS="$APPS" \
	--build-arg TOKEN=$TOKEN \
	--build-arg REPO=$REPO .
