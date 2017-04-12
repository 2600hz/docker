#!/bin/sh -e
if [ -n "$SKIP_BUILD" ]
then
	touch skip_build
	exit 0
fi

# REPO is global and must be defined on build
##git clone $REPO kazoo
chown user.user  kazoo

. erlang/activate
cd kazoo
if [ -n "$PROD_BUILD" ]
then
echo "Production branch was set: $PROD_BUILD"
git checkout -b alz-prod-4.0 origin/alz-4.0
else
COMMIT=$(cat ~/commit)
echo "Using commit: $COMMIT"
git reset --hard $COMMIT
git clean -d -f
fi
make deps
