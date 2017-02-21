# Kazoo container

## Default build

By default the latest version of Kazoo is checked out on build. It is possible to override this by
specifying commit number and repository to build.sh command:
```sh
./build.sh [COMMIT] [REPO]
```

## Development build

If you already have Kazoo sources and just want to run one or more Kazoo instances exactly this version
then you need to specify `SKIP_BUILD` environment variable before build:
```sh
SKIP_BUILD=1 ./build.sh
```

In this case no Kazoo source will be checked out, instead the container will try to build and run
the source code on container startup, and you will be required to provide Kazoo source tree as Docker volume:
```sh
KAZOO_SOURCE=path/to/checked-out/kazoo ./run.sh
```

## UID/GID matching

In order for a Kazoo container to write files to the provided volume, the owner of the mounted folder must be the same numerical value as in container, therefore we're trying to guess and match it during build process.
