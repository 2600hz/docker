#!/bin/sh
epmd -daemon
exec freeswitch -conf /etc/kazoo/freeswitch -log /var/log/freeswitch -db /var/lib/freeswitch/db -nonat -nf
