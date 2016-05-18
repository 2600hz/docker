Kazoo components as docker images
=================================

Goal
====

To have all Kazoo components as independent docker containers.

Notes
=====

1. All components depends on base-os image (Debian:Jessie with Erlang 17 preinstalled)
2. BigCouch is superceded by CouchDB 2.0
3. Actual container configuration is missing (for now they only compiles)
4. All images are not optimized to reduce size (although it should be possible)
