FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY build/setup-os.sh setup-os.sh
RUN ./setup-os.sh

COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY etc/ etc

COPY build/build.sh build.sh
RUN ./build.sh

COPY build/config-kazoo.sh config-kazoo.sh
RUN ./config-kazoo.sh

COPY build/run.sh run.sh
ENTRYPOINT ["./run.sh"]