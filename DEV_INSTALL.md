# Create a development environment

This is a way to get a "uniform" development environment up quickly, particularly useful when onboarding new developers.

## Docker

[Docker](https://en.wikipedia.org/wiki/Docker_\(software\) "Docker") is used to "container"-ize the environment.

## Host system

We need to setup the host system first. This guide will be using CentOS 7 (but the containers will be running Debian). Adjust instructions accordingly.

From a minimal CentOS 7 installation:
1. Setup docker repo
2. Clone the 2600hz/docker repo
3. Build all the components needed by Kazoo
4. Start hacking!

### Setup docker repo

See the official [docs](https://docs.docker.com/engine/installation/linux/centos/) but the quick version is:

```shell
yum install -y yum-utils
yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install docker-ce
systemctl start docker
systemctl enable docker
docker run hello-world
```

### Clone the 2600Hz/docker repo

```shell
yum install git-core
cd /opt/
$/opt: git clone https://github.com/2600hz/docker
$/opt: cd docker/
```

### Build the containers

```shell
$/opt/docker: ./build.sh
```

This will take a **long** time on the first run!

Once finished, start all the services:

```shell
$/opt/docker: ./run.sh
```

Update the hosts file:

```shell
$/opt/docker: ./hosts.sh >> /etc/hosts
```

Your hosts file should contain something along the lines of:

```
172.18.0.6 monster-ui.kazoo
172.18.0.2 rabbitmq.kazoo
172.18.0.5 freeswitch.kazoo
172.18.0.3 couchdb.kazoo
```

And run the post-install script:

```shell
$/opt/docker: ./after-start.sh
```
This takes a while to run as well.

### Start hacking

You can clone Kazoo from any repo you want:

```shell
$/opt/docker: cd kazoo
$/opt/docker/kazoo: ./build.sh [REPO_URL]
```

`REPO_URL` will default to `https://github.com/2600hz/kazoo.git`.

You can connect to the running Kazoo shell:

```shell
$/opt/docker/kazoo: ./console
```

This will be **the** shell so take care when detaching.

There is an alias for `SUP` that you can use:

```shell
$/opt/docker/kazoo: ./sup -h
Usage: sup [-?] [-n [<node>]] [-c [<cookie>]] [-t [<timeout>]] [-v]
           [<module>] [<function>] [args ...]

  -?, --help     Show the program options
  -n, --node     Node name [default: kazoo_apps]
  -c, --cookie   Erlang cookie [default: change_me]
  -t, --timeout  Command timeout [default: 0]
  -v, --verbose  Be verbose
  <module>       The name of the remote module
  <function>     The name of the remote module's function
```

This will take care of connecting to the container and running the SUP command as you would for any normal Kazoo operation.

Everything is installed, in the container to `/home/user`

### Install Emacs

Or your editor of choice:

```shell
docker exec -i --user root kazoo.kazoo apt-get install -y emacs-nox
```

Then start it up:

```shell
docker exec -i --user root kazoo.kazoo emacs
```

Kazoo source directory is `~/kazoo`

**Happy Hacking!**
