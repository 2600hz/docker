#!/bin/sh
. erlang/activate
cd kazoo
git fetch
git reset --hard $COMMIT
make compile build-dev-release
