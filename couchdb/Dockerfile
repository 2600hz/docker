FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/setup-node.sh setup-node.sh
RUN ./setup-node.sh

COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY build/build.sh build.sh
RUN ./build.sh
