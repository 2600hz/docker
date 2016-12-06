#!/bin/sh
. erlang/activate
cd kazoo
git fetch
COMMIT=$(cat ~/commit)
git reset --hard $COMMIT
make compile build-dev-release
