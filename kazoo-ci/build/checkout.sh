#!/bin/sh
MB=/home/user/make-busy
MB_COMMIT=$(cat $MB/ci/make-busy.commit)
cd $MB && git fetch && git reset --hard $MB_COMMIT

TESTS=/home/user/tests
CF_COMMIT=$(cat $MB/ci/make-busy-callflow.commit)
cd $TESTS/Callflow && git fetch && git reset --hard $CF_COMMIT