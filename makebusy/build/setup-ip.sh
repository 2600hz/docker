#!/bin/sh
AUTH_IP_ADDRESS=`ifconfig eth0 | grep inet | grep -v inet6 | awk '{ print $2 }'`
PBX_IP_ADDRESS=`build/next-ip.pl $AUTH_IP_ADDRESS`
CARRIER_IP_ADDRESS=`build/next-ip.pl $PBX_IP_ADDRESS`

echo auth:$AUTH_IP_ADDRESS pbx:$PBX_IP_ADDRESS carrier:$CARRIER_IP_ADDRESS
ifconfig eth0:0 $PBX_IP_ADDRESS
ifconfig eth0:1 $CARRIER_IP_ADDRESS

sed -i "s|\"sip-ip\" value=\".*\"|\"sip-ip\" value=\"$AUTH_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/auth.xml
sed -i "s|\"ext-sip-ip\" value=\".*\"|\"ext-sip-ip\" value=\"$AUTH_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/auth.xml
sed -i "s|\"rtp-ip\" value=\".*\"|\"rtp-ip\" value=\"$AUTH_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/auth.xml
sed -i "s|\"ext-rtp-ip\" value=\".*\"|\"ext-rtp-ip\" value=\"$AUTH_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/auth.xml

sed -i "s|\"sip-ip\" value=\".*\"|\"sip-ip\" value=\"$PBX_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/pbx.xml        
sed -i "s|\"ext-sip-ip\" value=\".*\"|\"ext-sip-ip\" value=\"$PBX_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/pbx.xml
sed -i "s|\"rtp-ip\" value=\".*\"|\"rtp-ip\" value=\"$PBX_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/pbx.xml
sed -i "s|\"ext-rtp-ip\" value=\".*\"|\"ext-rtp-ip\" value=\"$PBX_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/pbx.xml

sed -i "s|\"sip-ip\" value=\".*\"|\"sip-ip\" value=\"$CARRIER_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/carrier.xml
sed -i "s|\"ext-sip-ip\" value=\".*\"|\"ext-sip-ip\" value=\"$CARRIER_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/carrier.xml        
sed -i "s|\"rtp-ip\" value=\".*\"|\"rtp-ip\" value=\"$CARRIER_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/carrier.xml
sed -i "s|\"ext-rtp-ip\" value=\".*\"|\"ext-rtp-ip\" value=\"$CARRIER_IP_ADDRESS\"|" /etc/freeswitch/sip_profiles/carrier.xml

cp etc/config.json ./
API_KEY=$(cat api_key)
sed -i "s|AUTH_IP|$AUTH_IP_ADDRESS|" config.json
sed -i "s|PBX_IP|$PBX_IP_ADDRESS|" config.json
sed -i "s|CARRIER_IP|$CARRIER_IP_ADDRESS|" config.json
sed -i "s|API_KEY|$API_KEY|" config.json
cp config.json /var/www/html/make-busy

systemctl restart freeswitch &
