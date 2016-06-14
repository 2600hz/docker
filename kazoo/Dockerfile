FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

ARG REPO=https://github.com/2600hz/kazoo.git

USER user

COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY etc/relx.config.src kazoo/rel/relx.config.src
COPY build/build.sh build.sh
RUN ./build.sh

COPY etc/config.ini config.ini
COPY build/run.sh run.sh
ENTRYPOINT ./run.sh

# Automatically trigger rebuild if commit changes
COPY etc/commit /root/commit
RUN ./build.sh

ENV PATH $PATH:/home/user/bin
COPY build/sup bin/sup 

COPY build/config-kazoo.sh config-kazoo.sh
RUN ./config-kazoo.sh
