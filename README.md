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

Usage
=====

```
build.sh
up.sh
hosts.sh >> /etc/hosts
admin.sh
```

admin.sh gives access to the host inside the kazoo network.

TODO
====

* Initial configuration instructions
* Prepare production images (binary only, without build infrastructure)
* Kazoo and Monster-UI should rebuild themselves on commits
* Third-party images should be version-bounded
