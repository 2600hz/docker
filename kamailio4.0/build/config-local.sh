#!/bin/sh -e
cp /etc/kamailio/local.cfg.orig /etc/kamailio/local.cfg
LOCAL=/etc/kamailio/local.cfg

MY_IP=$(hostname -i)

# ip address
/bin/sed -i "s/MY_IP_ADDRESS!127.0.0.1/MY_IP_ADDRESS!$MY_IP/g" $LOCAL

# domain
/bin/sed -i "s/kamailio.2600hz.com/$HOSTNAME/g" $LOCAL

# rabbitmq
/bin/sed -i "s/MY_AMQP_URL!kazoo:\/\/guest:guest@127.0.0.1:5672/MY_AMQP_URL!kazoo:\/\/guest:guest@$RABBITMQ:5672/g" $LOCAL

kamctl dispatcher add 1 sip:$FREESWITCH:11000 0 1 ' ' ' '

