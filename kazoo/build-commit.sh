#!/bin/sh -e
COMMIT=$1
REPO=${2:-"https://github.com/alianza-dev/kazoo.git"}
NETWORK=${NETWORK:-"kazoo"}
KZ_BUILD=${KZ_BUILD:-""}
echo Using repository $REPO commit $COMMIT flags:$KZ_BUILD
echo $COMMIT > etc/commit
docker build $KZ_BUILD -q -t $NETWORK/kazoo --build-arg REPO=$REPO .
