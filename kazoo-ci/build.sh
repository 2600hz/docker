#!/bin/sh -e

TOKEN=$1
DOCKER=${2:-"$(getent group docker | cut -d: -f3)"}
if [ -z $TOKEN ] || [ -z $DOCKER ]
then
    echo Please provide a token to access private repo: $0 token [docker_gid]
    exit 1
fi

repo_mb=https://github.com/2600hz/make-busy
repo_mb_callflow=https://$TOKEN@github.com/2600hz/make-busy-callflow.git
repo_mb_conference=https://$TOKEN@github.com/2600hz/make-busy-conference.git
commit_mb="$(../bin/get-commit $repo_mb)"
commit_mb_callflow="$(../bin/get-commit $repo_mb_callflow)"
commit_mb_conference="$(../bin/get-commit $repo_mb_conference)"

docker build $BUILD_FLAGS \
       --build-arg TOKEN=$TOKEN \
       --build-arg DOCKER=$DOCKER \
       --build-arg REPO_MB=$repo_mb \
       --build-arg REPO_MB_CALLFLOW=$repo_mb_callflow \
       --build-arg REPO_MB_CONFERENCE=$repo_mb_conference \
       --build-arg COMMIT_MB=$commit_mb \
       --build-arg COMMIT_MB_CALLFLOW=$commit_mb_callflow \
       --build-arg COMMIT_MB_CONFERENCE=$commit_mb_conference \
       -t kazoo/ci .
