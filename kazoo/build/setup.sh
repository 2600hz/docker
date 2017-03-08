#!/bin/sh -e
if [ -n "$SKIP_BUILD" ]
then
	touch skip_build
	exit 0
fi

# REPO is global and must be defined on build
git clone $REPO kazoo

. erlang/activate
cd kazoo
COMMIT=$(cat ~/commit)
git reset --hard $(cat ~/commit)
make deps
