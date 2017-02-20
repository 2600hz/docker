#!/bin/sh -e
COMMIT=$(cat commit)
cd freeswitch && git reset --hard $COMMIT
