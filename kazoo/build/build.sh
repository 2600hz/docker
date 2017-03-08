#!/bin/sh -e
[ -n "$SKIP_BUILD" ] && exit 0
. erlang/activate
cd kazoo
git fetch
COMMIT=$(cat ~/commit)
git reset --hard $COMMIT
git clean -d -f
cp ../sys.config rel/
make compile build-dev-release
