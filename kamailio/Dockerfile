FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY etc/modules.lst /home/user/kamailio/
COPY build/build.sh build.sh
RUN ./build.sh

ENV HOME=/home/user

COPY etc/ etc
COPY build/config-kazoo.sh config-kazoo.sh
RUN ./config-kazoo.sh

COPY build/run.sh run.sh
COPY build/config-local.sh config-local.sh
ENTRYPOINT ["./run.sh"]
