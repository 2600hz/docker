Kazoo as docker containers
==========================

Goal
====

To have all Kazoo components as independent docker containers. Containers are buildable
from scratch using source code repositories only.

Notes
=====

* All components depends on base-os image (Debian:Jessie with Erlang 18 preinstalled)
* BigCouch is replaced by CouchDB 2.0
* All images are not optimized by size (however it is possible to combine)

Init
====

```sh
build.sh
run.sh
hosts.sh >> /etc/hosts
```

admin.sh gives access to the host inside the kazoo network.
You need hosts file to access ui by http://kazoo-ui.kazoo and http://monster-ui.kazoo, and they,
in turn, need to access http://kazoo.kazoo:8000, and you probably want to run UI on your host.

Please note each container run.sh and build.sh should be run inside their respective folders.

After start
===========

To initialize the system after clean start (with empty database) there is after-start.sh script that:

1. Creates a master account admin with password admin
2. Adds freeswitch node to Kazoo
3. Registers sound prompts
4. Registers Monster-UI 'apps'

In order to make it work you need to wait some time after Kazoo container starts (while it creates databases).

Kazoo builds
============

```sh
cd kazoo
./build.sh [REPO]
```

Default REPO is https://github.com/2600hz/kazoo.git if omitted.

It automatically checks and caches builds for the latest commit. When latest commit hash changes
only necessary steps are performed to update the image (git pull/make install actually),
utilizing the docker caching ability.

Kazoo Erlang console
====================

```sh
docker exec -ti kazoo.kazoo ./run.sh remote_console
# or
cd kazoo ; ./console
```

Kazoo sup
=========

```sh
cd kazoo

# Running apps
./sup kapps_controller running_apps

# Add Freeswitch node
./sup ecallmgr_maintenance add_fs_node freeswitch@freeswitch.kazoo

# Get freeswitch nodes (should be [<<"freeswitch@freeswitch.kazoo">>])
./sup ecallmgr_config get fs_nodes

# Add admin user
./sup crossbar_maintenance create_account admin_name kamailio.kazoo admin admin

# Import Kazoo voice prompts
./sup kazoo_media_maintenance import_prompts /home/user/kazoo-sounds/kazoo-core/en/us en-us

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

Monster-UI
==========

How to register Monster-UI apps.

1. You need to have monster-ui and kazoo images running
2. You need to copy apps from monster-ui to kazoo
3. You need to 'register' these apps

```sh
docker cp monster-ui.kazoo:/usr/share/nginx/html/src/apps apps
docker cp apps kazoo.kazoo:/home/user
rm -rf apps
cd kazoo
./sup crossbar_maintenance init_apps /home/user/apps http://kazoo.kazoo:8000/v2
```

Clustering
==========

You can setup a Kazoo cluster, please see [cluster](cluster) folder. Here is how:
```sh
cd cluster
./run.sh
./after-start.sh
```
The setup comprises 3 networks: kazoo, zone1 and zone2. Hosts from zone1 and zone2 can communicate to network kazoo only.
In zone1 and zone2 there are kazoo instance and freeswitch instance, and in kazoo network there are monster-ui, rabbitmq, couchdb
and kamailio hosts.

You should run after-start.sh only after kazoo finishes database update.

Development
===========

Intended workflow:

1. edit source code
2. commit
3. rebuild and re-run container on commit (either locally or remotely)

TODO
====

* Add haproxy to setup (balance the load between two or more instances of kazoo)
* Inter-container file exchange for sup (monster-ui apps, kazoo-sounds)
* Parametrize FROM in Dockerfiles
