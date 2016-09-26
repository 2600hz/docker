#!/bin/sh
cp /etc/kazoo/kamailio/local.cfg.orig /etc/kazoo/kamailio/local.cfg
LOCAL=/etc/kazoo/kamailio/local.cfg

MY_IP=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $NF}')

# ip address
/bin/sed -i "s/MY_IP_ADDRESS!127.0.0.1/MY_IP_ADDRESS!$MY_IP/g" $LOCAL

# domain
/bin/sed -i 's/kamailio.2600hz.com/kamailio.kazoo/g' $LOCAL

# rabbitmq
/bin/sed -i 's/MY_AMQP_URL!kazoo:\/\/guest:guest@127.0.0.1:5672/MY_AMQP_URL!kazoo:\/\/guest:guest@rabbitmq.kazoo:5672/g' $LOCAL
