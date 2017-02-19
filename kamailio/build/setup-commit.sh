#!/bin/sh -e
COMMIT=$(cat /root/commit)
cd kamailio && git reset --hard $COMMIT
