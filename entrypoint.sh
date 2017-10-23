#!/bin/bash
set -x

if [ "$APT_MIRRORS" = "aliyun" ];then
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
    npm  config set registry https://registry.npm.taobao.org
    yarn config set registry https://registry.npm.taobao.org
fi

exec "$@"