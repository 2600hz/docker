#!/bin/sh
FSCFG=/usr/local/freeswitch/conf

IP=`ifdata -pa eth0`
echo type:$TYPE ip:$IP

sed -i "s|\"sip-ip\" value=\".*\"|\"sip-ip\" value=\"$IP\"|" $FSCFG/sip_profiles/profile.xml
sed -i "s|\"ext-sip-ip\" value=\".*\"|\"ext-sip-ip\" value=\"$IP\"|" $FSCFG/sip_profiles/profile.xml
sed -i "s|\"rtp-ip\" value=\".*\"|\"rtp-ip\" value=\"$IP\"|" $FSCFG/sip_profiles/profile.xml
sed -i "s|\"ext-rtp-ip\" value=\".*\"|\"ext-rtp-ip\" value=\"$IP\"|" $FSCFG/sip_profiles/profile.xml

sed -i "s|cmd=\"exec\" data=\".*|cmd=\"exec\" data=\"wget -qO - http://makebusy.kazoo/make-busy/gateways.php?type=$TYPE\"/>|" $FSCFG/sip_profiles/profile.xml
