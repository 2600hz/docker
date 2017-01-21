FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

ENV NETWORK=kazoo
ENV RABBITMQ=rabbitmq.$NETWORK
ARG REPO=https://github.com/kamailio/kamailio.git
ARG CONFIG=master

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/commit commit
COPY build/setup-commit.sh build/setup-commit.sh
RUN build/setup-commit.sh

COPY build/configure.sh configure.sh
RUN ./configure.sh

COPY build/build.sh build/build.sh
RUN build/build.sh

COPY build/setup-config.sh build/setup-config.sh
RUN build/setup-config.sh

COPY build/install.sh install.sh
RUN ./install.sh

USER kamailio
WORKDIR "/usr/local/kamailio"

ENV PATH "$PATH:/usr/local/kamailio/sbin"
COPY build/config-local.sh config-local.sh
COPY build/run.sh run.sh
COPY build/dispatcher_add.sh sbin/dispatcher_add.sh
CMD [ "./run.sh" ]
