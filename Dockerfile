FROM phusion/baseimage:0.9.22
LABEL authors="WangYan <i@wangyan.org>"

RUN apt-get -y update; \
    apt-get -y upgrade; \
    apt-get -y install git-core net-tools

ENV NODE_VERSION 8.9.1
RUN set -xe; \
    curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz"; \
    tar -zxf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1; \
    rm -f node-v$NODE_VERSION-linux-x64.tar.gz; \
    node -v 

RUN set -xe; \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
    apt-get update; apt-get -y install yarn --no-install-recommends --no-install-suggests; \
    yarn -v; \
    yarn global add pm2; \
    npm cache clean --force && rm -rf /tmp/npm*; \
    yarn cache clean --force && rm -rf /tmp/yarn*

RUN apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/sbin/my_init"]