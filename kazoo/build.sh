#!/bin/sh
REPO=https://github.com/2600hz/kazoo.git
if [ "$1" = "" ]
then
	COMMIT=$(../bin/get-commit $REPO)
else
	COMMIT=$1
fi
echo $COMMIT > etc/commit
echo Using repository $REPO commit: $COMMIT
docker build -t kazoo/kazoo --build-arg REPO=$REPO .
