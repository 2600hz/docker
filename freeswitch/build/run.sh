#!/bin/sh
epmd -daemon
MY_IP=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $NF}')
echo freeswitch ip $MY_IP
exec /usr/local/freeswitch/bin/freeswitch -nf
