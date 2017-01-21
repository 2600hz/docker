#!/bin/sh
COMMIT=$(cat /root/commit)
cd kamailio && git reset --hard $COMMIT
