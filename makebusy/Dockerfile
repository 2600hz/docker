FROM centos/systemd
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY etc/.ssh /root/.ssh

COPY build/setup.sh build/setup.sh
RUN build/setup.sh
COPY etc/freeswitch.service /usr/lib/systemd/system/freeswitch.service

COPY build/run.sh build/run.sh
COPY build/next-ip.pl build/next-ip.pl
COPY etc/config.json etc/config.json
COPY build/setup-ip.sh build/setup-ip.sh

COPY build/setup-tests.sh build/setup-tests.sh
RUN build/setup-tests.sh

CMD ["/usr/sbin/init"]
