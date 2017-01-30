#!/bin/sh
TOKEN=$1
DOCKER=${2:-"$(getent group docker | cut -d: -f3)"}
if [ -z $TOKEN ] || [ -z $DOCKER ]
then
	echo Please provide a token to access private repo: $0 token [docker_gid]
	exit 1
fi
../bin/get-commit https://github.com/2600hz/make-busy > etc/make-busy.commit
../bin/get-commit https://$TOKEN@github.com/2600hz/make-busy-callflow.git > etc/make-busy-callflow.commit
docker build $BUILD_FLAGS -t kazoo/ci --build-arg TOKEN=$TOKEN --build-arg DOCKER=$DOCKER .
