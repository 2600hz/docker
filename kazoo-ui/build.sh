#!/bin/sh
if [ "$1" = "" ]
then
	REPO=https://github.com/2600hz/kazoo-ui.git
else
	REPO=$1
fi
echo Using repository $REPO
../bin/get-commit $REPO > etc/commit
echo Using repository $REPO commit: `cat etc/commit`
docker build -t kazoo/kazoo-ui  --build-arg REPO=$REPO .
