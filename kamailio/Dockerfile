FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

WORKDIR "/root"

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY etc/kamctlrc .kamctlrc
COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY build/run.sh run.sh
ENTRYPOINT ["./run.sh"]
