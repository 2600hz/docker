FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/setup-erlang.sh setup-erlang.sh
RUN ./setup-erlang.sh

ARG REPO=https://github.com/2600hz/kazoo.git

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
COPY etc/vm.args kazoo/_rel/kazoo/releases/4.0.0/vm.args

