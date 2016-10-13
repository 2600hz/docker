FROM centos/systemd
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY etc/.ssh /root/.ssh

COPY etc/commit /root/commit
COPY build/setup.sh build/setup.sh
RUN build/setup.sh
COPY etc/freeswitch.service /usr/lib/systemd/system/freeswitch.service

COPY build/run.sh build/run.sh
COPY build/next-ip.pl build/next-ip.pl
COPY etc/config.json etc/config.json
COPY build/setup-ip.sh build/setup-ip.sh
COPY etc/api_key api_key

COPY build/setup-tests.sh build/setup-tests.sh
RUN build/setup-tests.sh

COPY build/run-test.sh run-test.sh

CMD ["/usr/sbin/init"]
