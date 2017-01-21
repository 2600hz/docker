FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root

ARG REPO=https://freeswitch.org/stash/scm/fs/freeswitch.git
ARG CONFIG=master

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/commit commit
COPY build/setup-commit.sh build/setup-commit.sh
RUN build/setup-commit.sh

COPY etc/modules.conf freeswitch/modules.conf
COPY build/configure.sh build/configure.sh
RUN build/configure.sh

COPY build/build.sh build/build.sh
RUN build/build.sh

COPY build/setup-config.sh build/setup-config.sh
RUN build/setup-config.sh

COPY build/install.sh install.sh
RUN build/install.sh

USER freeswitch
WORKDIR "/usr/local/freeswitch"

COPY build/run.sh run.sh
ENTRYPOINT [ "./run.sh" ]
