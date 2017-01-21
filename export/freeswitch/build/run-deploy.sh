#!/bin/sh
./set-xml-key.sh conf/autoload_configs/switch.conf.xml rtp-start-port $RTP_START_PORT
./set-xml-key.sh conf/autoload_configs/switch.conf.xml rtp-end-port $( expr $RTP_START_PORT + 999 )
exec ./run.sh
