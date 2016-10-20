#!/bin/sh
AUTH_IP=$1
PBX_IP=`build/next-ip.pl $AUTH_IP`
CARRIER_IP=`build/next-ip.pl $PBX_IP`

echo auth:$AUTH_IP pbx:$PBX_IP carrier:$CARRIER_IP

cp etc/config.json ./
sed -i "s|AUTH_IP|$AUTH_IP|" config.json
sed -i "s|PBX_IP|$PBX_IP|" config.json
sed -i "s|CARRIER_IP|$CARRIER_IP|" config.json
cp config.json /var/www/html/make-busy
ln -s /var/www/html/make-busy ./make-busy
