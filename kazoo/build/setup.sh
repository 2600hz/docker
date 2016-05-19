#!/bin/sh
# REPO is global and must be defined on build
git clone --depth 1 --no-single-branch $REPO kazoo

. erlang/activate
cd kazoo
make deps
