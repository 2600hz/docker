FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY etc/modules.conf freeswitch/modules.conf
COPY build/build.sh build.sh
RUN ./build.sh

COPY build/install.sh install.sh
RUN ./install.sh

COPY build/config-kazoo.sh config-kazoo.sh
RUN ./config-kazoo.sh

COPY etc/freeswitch /usr/local/freeswitch/conf

USER freeswitch
WORKDIR "/usr/local/freeswitch"

COPY build/run.sh run.sh
ENTRYPOINT [ "./run.sh" ]
