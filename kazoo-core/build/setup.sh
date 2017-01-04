#!/bin/sh
# REPO is global and must be defined on build
git clone $REPO kazoo

. erlang/activate
cd kazoo
make deps
