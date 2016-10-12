FROM kazoo/erlang
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ARG REPO=https://github.com/2600hz/kazoo.git
ARG COMMIT=HEAD

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/config.ini config.ini
COPY build/run.sh run.sh
ENTRYPOINT ./run.sh

ENV PATH $PATH:/home/user/bin
COPY build/sup bin/sup 

COPY etc/commit /home/user/commit
COPY etc/relx.config.src kazoo/rel/relx.config.src
COPY build/build.sh build/build.sh
RUN build/build.sh
