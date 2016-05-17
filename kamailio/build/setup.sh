#!/bin/sh
kamdbctl reinit
kamctl dispatcher add 1 sip:freeswitch.fqdn:11000 1 5 ' ' 'freeswitch'