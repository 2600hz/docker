#!/bin/sh
TOKEN=$1
DOCKER=${2:-"$(getent group docker | cut -d: -f3)"}
if [ -z $TOKEN ] || [ -z $DOCKER ]
then
	echo Please provide a token to access private repo: $0 token [docker_gid]
	exit 1
fi
docker build $BUILD_FLAGS -t kazoo/ci --no-cache --build-arg TOKEN=$TOKEN --build-arg DOCKER=$DOCKER .
