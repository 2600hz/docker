#!/bin/sh
LOCAL=/usr/local/kamailio/etc/kamailio/local.cfg

MY_IP=$(hostname -i)

# ip address
/bin/sed -i "s/MY_IP_ADDRESS!.*!/MY_IP_ADDRESS!$MY_IP!/g" $LOCAL

# domain
/bin/sed -i "s/kamailio.2600hz.com/$HOSTNAME/g" $LOCAL

# rabbitmq
/bin/sed -i "s/MY_AMQP_URL!.*!/MY_AMQP_URL!kazoo:\/\/guest:guest@$RABBITMQ:5672!/g" $LOCAL

