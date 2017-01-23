#!/bin/sh
xmlstarlet edit --inplace -u '/configuration/settings/param[@name="rtp-start-port]/@value' -v $RTP_START_PORT conf/autoload_configs/switch.conf.xml
xmlstarlet edit --inplace -u '/configuration/settings/param[@name="rtp-end-port]/@value' -v  $( expr $RTP_START_PORT + 999 ) conf/autoload_configs/switch.conf.xml
exec ./run.sh
