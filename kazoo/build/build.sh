#!/bin/sh -e
[ -n "$SKIP_BUILD" ] && exit 0
. erlang/activate
cd kazoo

if [ -n "$PROD_BUILD" ]
then
echo "Using production branch: $PROD_BUILD"
git checkout alz-prod-4.0
cp ../sys.config rel/
make compile build-release
else
git fetch
COMMIT=$(cat ~/commit)
git reset --hard $COMMIT
git clean -d -f
cp ../sys.config rel/
make compile build-dev-release
fi
