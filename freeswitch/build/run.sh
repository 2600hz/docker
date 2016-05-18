#!/bin/sh
epmd -daemon
exec /usr/local/freeswitch/bin/freeswitch -nf