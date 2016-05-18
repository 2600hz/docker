FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

WORKDIR "/root"

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/run.sh run.sh
ENTRYPOINT [ "./run.sh" ]
