#!/bin/sh -e
ROOT=/usr/local/kamailio/etc/kamailio

MY_IP=$(hostname -i)
MY_HOSTNAME=$(hostname)

# ip address
/bin/sed -i "s/MY_IP_ADDRESS!.*!/MY_IP_ADDRESS!$MY_IP!/g" $ROOT/local.cfg

# hostname
/bin/sed -i "s/MY_HOSTNAME!.*!/MY_HOSTNAME!$MY_HOSTNAME!/g" $ROOT/local.cfg

# rabbitmq
/bin/sed -i "s/MY_AMQP_URL!.*!/MY_AMQP_URL!kazoo:\/\/guest:guest@$RABBITMQ:5672!/g" $ROOT/local.cfg

# reduce spawn children
/bin/sed -i "s/^children\s*=.*$/children = 2/g" $ROOT/default.cfg
/bin/sed -i "s/^tcp_children\s*=.*$/tcp_children = 2/g" $ROOT/default.cfg
/bin/sed -i "s/amqp_consumer_workers.*$/amqp_consumer_workers\", 4);/" $ROOT/default.cfg

# advertise
if [ ! -z "$EXT_IP" ]
then
	/bin/sed -i "s/^listen=UDP_SIP.*$/listen=UDP_SIP advertise $EXT_IP:5060/" $ROOT/local.cfg
fi
