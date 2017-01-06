#!/bin/sh
. /home/user/erlang/activate
epmd -daemon
exec /opt/kazoo/scripts/dev-start-apps.sh
