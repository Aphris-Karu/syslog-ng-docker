FROM debian:stretch
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

RUN apt-get update -qq && apt-get install -y  \
    wget  \
    gnupg2  

RUN wget -qO - https://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_9.0/Release.key | apt-key add - 
RUN echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_9.0 ./' | tee --append /etc/apt/sources.list.
d/syslog-ng-obs.list  

RUN apt-get update -qq && apt-get install -y  \
    syslog-ng

ADD syslog-ng.conf /etc/syslog-ng/syslog-ng.conf 
ADD start-syslog-ng.sh /start-syslog-ng.sh 
ADD syslog-ng /etc/logrotate.d/syslog-ng
RUN mv /etc/cron.daily/logrotate /srv/logrotate

RUN chmod 755 /start-syslog-ng.sh && \
chmod 644 /etc/logrotate.d/syslog-ng && \
find /usr/lib/ -name 'libjvm.so*' | xargs dirname | tee --append /etc/ld.so.conf.d/openjdk-libjvm.conf && \
ldconfig

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

ENTRYPOINT ["/start-syslog-ng.sh"]
