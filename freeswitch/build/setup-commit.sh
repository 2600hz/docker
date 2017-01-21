#!/bin/sh
COMMIT=$(cat commit)
cd freeswitch && git reset --hard $COMMIT
