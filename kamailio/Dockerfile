FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ENV NETWORK=kazoo
ENV RABBITMQ=rabbitmq.$NETWORK
ENV FREESWITCH=freeswitch.$NETWORK

ARG REPO=https://github.com/kamailio/kamailio.git

USER root
WORKDIR /root

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY etc/commit /root/commit
COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/modules.lst /root/kamailio/
COPY build/build.sh build/build.sh
RUN build/build.sh

COPY etc/ etc
COPY build/config-kazoo.sh build/config-kazoo.sh
RUN build/config-kazoo.sh

COPY build/run.sh run.sh
COPY build/config-local.sh config-local.sh
ENTRYPOINT ["./run.sh"]
