#!/bin/sh
FILE=$1
KEY=$2
VALUE=$3

if [ ! -e $FILE ]
then
	echo Usage: $0 file key value
fi

# <param name="rtp-start-port" value="16384"/>
sed -i "s/name=\"$KEY\".*value=\".*\"/name=\"$KEY\" value=\"$VALUE\"/" $FILE
