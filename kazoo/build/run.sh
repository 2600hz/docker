#!/bin/sh
export KAZOO_CONFIG=/root/config.ini
cd kazoo
exec _rel/kazoo/bin/kazoo console
