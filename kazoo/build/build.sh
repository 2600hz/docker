#!/bin/sh
COMMIT=$(cat /home/user/commit)
. erlang/activate
cd kazoo
git fetch
git reset --hard $COMMIT
make compile build-dev-release
