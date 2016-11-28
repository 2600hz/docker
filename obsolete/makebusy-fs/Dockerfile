FROM kazoo/freeswitch
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

COPY etc etc

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY build/setup-ip.sh build/setup-ip.sh

COPY build/run-bs.sh run-bs.sh

ENTRYPOINT [ "./run-bs.sh" ]
