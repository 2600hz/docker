#!/bin/sh
FSCFG=/usr/local/freeswitch/conf

AUTH_IP_ADDRESS=`ifdata -pa eth0`
PBX_IP_ADDRESS=`build/next-ip.pl $AUTH_IP_ADDRESS`
CARRIER_IP_ADDRESS=`build/next-ip.pl $PBX_IP_ADDRESS`

echo auth:$AUTH_IP_ADDRESS pbx:$PBX_IP_ADDRESS carrier:$CARRIER_IP_ADDRESS
ifconfig eth0:0 $PBX_IP_ADDRESS
ifconfig eth0:1 $CARRIER_IP_ADDRESS

sed -i "s|\"sip-ip\" value=\".*\"|\"sip-ip\" value=\"$AUTH_IP_ADDRESS\"|" $FSCFG/sip_profiles/auth.xml
sed -i "s|\"ext-sip-ip\" value=\".*\"|\"ext-sip-ip\" value=\"$AUTH_IP_ADDRESS\"|" $FSCFG/sip_profiles/auth.xml
sed -i "s|\"rtp-ip\" value=\".*\"|\"rtp-ip\" value=\"$AUTH_IP_ADDRESS\"|" $FSCFG/sip_profiles/auth.xml
sed -i "s|\"ext-rtp-ip\" value=\".*\"|\"ext-rtp-ip\" value=\"$AUTH_IP_ADDRESS\"|" $FSCFG/sip_profiles/auth.xml

sed -i "s|\"sip-ip\" value=\".*\"|\"sip-ip\" value=\"$PBX_IP_ADDRESS\"|" $FSCFG/sip_profiles/pbx.xml        
sed -i "s|\"ext-sip-ip\" value=\".*\"|\"ext-sip-ip\" value=\"$PBX_IP_ADDRESS\"|" $FSCFG/sip_profiles/pbx.xml
sed -i "s|\"rtp-ip\" value=\".*\"|\"rtp-ip\" value=\"$PBX_IP_ADDRESS\"|" $FSCFG/sip_profiles/pbx.xml
sed -i "s|\"ext-rtp-ip\" value=\".*\"|\"ext-rtp-ip\" value=\"$PBX_IP_ADDRESS\"|" $FSCFG/sip_profiles/pbx.xml

sed -i "s|\"sip-ip\" value=\".*\"|\"sip-ip\" value=\"$CARRIER_IP_ADDRESS\"|" $FSCFG/sip_profiles/carrier.xml
sed -i "s|\"ext-sip-ip\" value=\".*\"|\"ext-sip-ip\" value=\"$CARRIER_IP_ADDRESS\"|" $FSCFG/sip_profiles/carrier.xml        
sed -i "s|\"rtp-ip\" value=\".*\"|\"rtp-ip\" value=\"$CARRIER_IP_ADDRESS\"|" $FSCFG/sip_profiles/carrier.xml
sed -i "s|\"ext-rtp-ip\" value=\".*\"|\"ext-rtp-ip\" value=\"$CARRIER_IP_ADDRESS\"|" $FSCFG/sip_profiles/carrier.xml
