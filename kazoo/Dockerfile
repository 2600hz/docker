FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ARG REPO=https://github.com/2600hz/kazoo.git

USER root

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

USER user

COPY build/setup-erlang.sh build/setup-erlang.sh
RUN build/setup-erlang.sh

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/relx.config.src kazoo/rel/relx.config.src
COPY build/build.sh build/build.sh
RUN build/build.sh

COPY etc/config.ini config.ini
COPY build/run.sh run.sh
ENTRYPOINT ./run.sh

# Automatically trigger rebuild if commit changes
COPY etc/commit /root/commit
RUN build/build.sh

ENV PATH $PATH:/home/user/bin
COPY build/sup bin/sup 

COPY build/config-kazoo.sh build/config-kazoo.sh
RUN build/config-kazoo.sh


