#!/bin/sh -e
COMMIT=$1
NETWORK=${NETWORK:-'kazoo'}
REPO=https://github.com/2600hz/kazoo.git
KZ_BUILD=${KZ_BUILD:-''}
echo Using repository $REPO commit $COMMIT flags:$KZ_BUILD
echo $COMMIT > etc/commit
docker build $KZ_BUILD -q -t $NETWORK/kazoo --build-arg REPO=$REPO .
