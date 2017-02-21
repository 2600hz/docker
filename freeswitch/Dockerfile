FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root

ARG NETWORK
ARG REPO
ARG FREESWITCH_COMMIT
ARG CONFIG=master

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/modules.conf freeswitch/modules.conf
COPY build/configure.sh build/configure.sh
RUN build/configure.sh

COPY build/build.sh build/build.sh
RUN build/build.sh

COPY build/setup-config.sh build/setup-config.sh
RUN build/setup-config.sh

COPY build/install.sh build/install.sh
RUN build/install.sh

USER freeswitch
WORKDIR "/usr/local/freeswitch"

COPY build/run.sh run.sh
ENTRYPOINT [ "./run.sh" ]
