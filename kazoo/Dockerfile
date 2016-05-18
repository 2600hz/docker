FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY build/setup-erlang.sh setup-erlang.sh
RUN ./setup-erlang.sh

COPY build/build.sh build.sh
RUN ./build.sh
