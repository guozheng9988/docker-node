FROM phusion/baseimage:0.9.21
MAINTAINER WangYan <i@wangyan.org>

RUN apt-get -y update && apt-get -y install git-core net-tools

ENV NODE_VERSION 6.10.3

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" && \
    tar -zxf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ./node-v$NODE_VERSION-linux-x64.tar.gz

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/sbin/my_init"]