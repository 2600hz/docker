FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ARG REPO=https://github.com/2600hz/kazoo.git
ARG COMMIT=HEAD

USER root

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

USER user

COPY build/setup-erlang.sh build/setup-erlang.sh
RUN build/setup-erlang.sh

USER root
