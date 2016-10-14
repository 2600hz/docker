Kazoo Docker Meta
=================

A container to build the Kazoo.

How to run
==========

```sh
docker build -t kazoo/meta .
docker run -v /var/run/docker.sock:/var/run/docker.sock --entrypoint ./build.sh -ti kazoo/meta
```
