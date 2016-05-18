FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/build.sh build.sh
RUN ./build.sh

COPY build/install.sh install.sh
RUN ./install.sh

COPY build/run.sh run.sh
ENTRYPOINT [ "./run.sh" ]