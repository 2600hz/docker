#!/bin/bash -e

INSTALLED=`docker version --format '{{.Server.Version}}'`
REQUIRED="1.9.0"
if [ "$INSTALLED" != "$REQUIRED" ] && [ "$(printf "$REQUIRED\n$INSTALLED" | sort -V | head -n1)" == "$INSTALLED" ]
then
    echo Docker version $INSTALLED is probably too old, required version is $REQUIRED
    exit
fi

pushd base-os
./build.sh
popd
pushd kazoo-erlang
./build.sh
popd
pushd rabbitmq
./build.sh
popd
pushd couchdb
./build.sh
popd
pushd kamailio
./build.sh d62fd3e4976633aa6b827d527f4e15de0b08068b
popd
pushd freeswitch
# 1.6.13
./build.sh e755b430da70bd63eebf1dfddacdce48ce863fce
popd
pushd kazoo
./build.sh
popd
pushd monster-ui
./build.sh
popd
