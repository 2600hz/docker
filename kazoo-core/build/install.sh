#!/bin/sh

groupadd kazoo

adduser --disabled-password --quiet --system --home /opt/kazoo --ingroup kazoo kazoo

ln -s /usr/local/src/kazoo-configs /etc/kazoo
