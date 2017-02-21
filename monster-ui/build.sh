#!/bin/sh -e

NETWORK=${NETWORK:-'kazoo'}
REPO=${2:-'https://github.com/2600hz/monster-ui.git'}
commit_monster=${1:-"$(../bin/get-commit $REPO)"}

echo Using repository $REPO commit $commit_monster
[ -e ./apps ] && APPS=$(cat apps)

docker build $BUILD_FLAGS \
       --build-arg APPS="$APPS" \
       --build-arg TOKEN=$TOKEN \
       --build-arg REPO=$REPO \
       --build-arg COMMIT_MONSTER=$commit_monster \
       -t $NETWORK/monster-ui .
