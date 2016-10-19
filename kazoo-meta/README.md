Kazoo Docker Meta
=================

A container to build and run Kazoo Docker Fleet.

How to run
==========

```sh
docker build -t jamhed/kazoo/meta .
docker run -v /var/run/docker.sock:/var/run/docker.sock --entrypoint ./build.sh -ti kazoo/meta
docker run -v /var/run/docker.sock:/var/run/docker.sock --entrypoint ./run.sh -ti kazoo/meta
```

How it works
============

The goal is to simplify build process for non-linux environments. The container needs to have access
to the host Docker and will build and run images on the host.

