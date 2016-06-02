Kazoo components as docker images
=================================

Goal
====

To have all Kazoo components as independent docker containers.

Notes
=====

* All components depends on base-os image (Debian:Jessie with Erlang 17 preinstalled)
* BigCouch is replaced by CouchDB 2.0
* All images are not optimized to reduce size (although it should be possible)

Init
====

```
build.sh
up.sh
hosts.sh >> /etc/hosts
```

admin.sh gives access to the host inside the kazoo network.

Kazoo builds
============
```
cd kazoo
./build.sh [REPO]
```

Default REPO is https://github.com/2600hz/kazoo.git if omitted.

It automatically checks and caches builds for the latest commit. When latest commit hash changes
only necessary steps are performed to update the image (git pull/make install actually),
utilizing the docker caching ability.

Kazoo Erlang console
====================
```
docker exec -ti kazoo ./run.sh remote_console
# or
cd kazoo ; ./console

```
Kazoo sup
=========
```
cd kazoo

# Running apps
./sup kapps_controller running_apps

# Add Freeswitch node
./sup ecallmgr_maintenance add_fs_node freeswitch@kazoo-freeswitch

# Get freeswitch nodes (should be [<<"freeswitch@kazoo-freeswitch">>])
./sup ecallmgr_config get fs_nodes

# Add admin user
./sup crossbar_maintenance create_account admin_name admin_realm admin admin_pass

# Check RabbitMQ
./sup kazoo_amqp_maintenance connection_summary

# Check nodes
./sup kz_nodes status
Node          : kazoo@kazoo
Version       : 4.0.0 - 18
Memory Usage  : 199.42MB
Processes     : 1820
Ports         : 53
Zone          : local
Broker        : amqp://kazoo-rabbitmq:5672
WhApps        : ecallmgr(1h45m58s)       ecallmgr(1h45m58s)       kazoo_globals(1h46m)     
Channels      : 0
Registrations : 0
Media Servers : freeswitch@kazoo-freeswitch (1h45m58s)

Node          : kamailio@kazoo-kamailio
Version       : 5.0.0-dev4
Memory Usage  : 14.27MB
Processes     : 0
Ports         : 0
Zone          : local
Broker        : amqp://kazoo-rabbitmq:5672
WhApps        : kamailio(1m43s)
```

TODO
====

* Kamailio integration
* Prepare production images (binary only, without build infrastructure)
* Kazoo and Monster-UI should rebuild themselves on commits
* Third-party images should be version-bounded
