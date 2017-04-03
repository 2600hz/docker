#!/bin/sh -e

# i need this to make fs think all traffic except localhost is external (to use ext-ip)
if [ ! -z "$EXT_IP" ]
then
	xmlstarlet edit --inplace -u '/include/profile[@name="sipinterface_1"]/settings/param[@name="local-network-acl"]/@value' -v "loopback.auto" conf/sip_profiles/sipinterface_1.xml
	xmlstarlet edit --inplace -u '/include/profile[@name="sipinterface_1"]/settings/param[@name="ext-rtp-ip"]/@value' -v "$EXT_IP" conf/sip_profiles/sipinterface_1.xml
fi
exec ./run.sh
