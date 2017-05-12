#!/bin/sh -e
cp /etc/kamailio/local.cfg.orig /etc/kamailio/local.cfg
LOCAL=/etc/kamailio/local.cfg

MY_IP=$(hostname -i)
MY_HOSTNAME=$(hostname)

# ip address
/bin/sed -i "s/MY_IP_ADDRESS!127.0.0.1/MY_IP_ADDRESS!$MY_IP/g" $LOCAL

# hostname
/bin/sed -i "s/MY_HOSTNAME!.*!/MY_HOSTNAME!$MY_HOSTNAME!/g" $LOCAL

# rabbitmq
/bin/sed -i "s/MY_AMQP_URL!kazoo:\/\/guest:guest@127.0.0.1:5672/MY_AMQP_URL!kazoo:\/\/guest:guest@$RABBITMQ:5672/g" $LOCAL

kamctl dispatcher add 1 sip:$FREESWITCH:11000 0 1 ' ' ' '

