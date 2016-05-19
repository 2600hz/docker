FROM rabbitmq
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/setup.sh setup.sh
RUN ./setup.sh
