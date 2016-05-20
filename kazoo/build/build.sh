#!/bin/sh
. erlang/activate
cd kazoo
git pull
make compile build-release
