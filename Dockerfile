FROM phusion/baseimage:0.9.21
LABEL authors="WangYan <i@wangyan.org>"

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install git-core net-tools

ENV NODE_VERSION 6.11.4
RUN set -xe && \
    curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" && \
    tar -zxf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 && \
    rm -f node-v$NODE_VERSION-linux-x64.tar.gz && \
    npm i -g yarn pm2 && \
    yarn global add yarn && \
    npm cache clean && rm -rf /tmp/npm*

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/sbin/my_init"]