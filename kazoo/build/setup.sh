#!/bin/sh -e
if [ -n "$SKIP_BUILD" ]
then
	touch skip_build
	exit 0
fi

# REPO is global and must be defined on build
git clone $REPO kazoo

. erlang/activate
COMMIT=$(cat ~/commit)
cd kazoo

if [ -z $BRANCH ]
then
	git reset --hard $COMMIT
	git clean -d -f
else
	git fetch origin $BRANCH:build_branch
	git checkout build_branch
	git clean -d -f
fi
make deps
