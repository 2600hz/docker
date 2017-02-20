#!/bin/sh -e
ID=$1
FREESWITCH=$2
if [ -z "$FREESWITCH" ]
then
	echo Usage: $0 id freeswitch_node
	exit
fi
kamctl dispatcher add $ID sip:$FREESWITCH:11000 0 1 ' ' ' '
