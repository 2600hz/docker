Kazoo components as docker images
=================================

Goal
====

To have all Kazoo components as independent docker containers. Containers are buildable
from scratch (source code repo), and rebuildable to allow quick development of various components:

1. edit source code
2. commit
3. rebuild and re-run container on commit

Notes
=====

* All components depends on base-os image (Debian:Jessie with Erlang 17 preinstalled)
* BigCouch is replaced by CouchDB 2.0
* All images are not optimized by size (however it should be possible)

Init
====

```
build.sh
run.sh
hosts.sh >> /etc/hosts
```

admin.sh gives access to the host inside the kazoo network.
You need hosts file to access ui by http://kazoo-ui.kazoo and http://monster-ui.kazoo, and they,
in turn, need to access http://kazoo.kazoo:8000, and you probably want to run UI on your host.

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
docker exec -ti kazoo.kazoo ./run.sh remote_console
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
./sup ecallmgr_maintenance add_fs_node freeswitch@freeswitch.kazoo

# Get freeswitch nodes (should be [<<"freeswitch@freeswitch.kazoo">>])
./sup ecallmgr_config get fs_nodes

# Add admin user
./sup crossbar_maintenance create_account admin_name admin_realm admin admin_pass

# Check RabbitMQ
./sup kazoo_amqp_maintenance connection_summary

# Check system status (this is probably what you should see)
./sup kz_nodes status
Node          : kazoo@kazoo.kazoo
Version       : 4.0.0 - 18
Memory Usage  : 190.55MB
Processes     : 1816
Ports         : 52
Zone          : local
Broker        : amqp://rabbitmq.kazoo:5672
WhApps        : blackhole(4m19s)         callflow(4m19s)          cdr(4m19s)               conference(4m19s)        
                crossbar(4m19s)          doodle(4m18s)            ecallmgr(4m18s)          fax(4m18s)               
                hangups(3m58s)           hotornot(3m58s)          jonny5(3m58s)            kazoo_globals(4m20s)     
                konami(3m58s)            media_mgr(3m58s)         milliwatt(3m58s)         omnipresence(3m58s)      
                pivot(3m58s)             registrar(3m58s)         reorder(3m58s)           runtime_tools            
                stepswitch(3m58s)        sysconf(4m19s)           teletype(3m58s)          trunkstore(3m58s)        
                webhooks(3m58s)          
Channels      : 0
Registrations : 0
Media Servers : freeswitch@freeswitch.kazoo (3m51s)

Node          : kamailio@kamailio.kazoo
Version       : 5.0.0-dev4
Memory Usage  : 14.27MB
Processes     : 0
Ports         : 0
Zone          : local
Broker        : amqp://rabbitmq.kazoo:5672
WhApps        : kamailio(17m37s)
```

TODO
====

* Parametrize on network/domain (kazoo now)
* Prepare production images (binary only, without build infrastructure)
* Kazoo and Monster-UI should rebuild themselves on commits
* Third-party images should be version-bounded
