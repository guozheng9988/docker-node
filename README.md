# docker-node

Ubuntu: `16.04` NodeJs: `6.11.4`

## 快速使用

> 国内主机可将 `idiswy/node:latest` 换成 `daocloud.io/wangyan/node:latest`
> 国内主机可增加`-e APT_MIRRORS=aliyun` 选项，使用国内的镜像源。

```shell
docker run --name node -e APT_MIRRORS=aliyun -d idiswy/node:latest
```

## 了解更多

关于`NodeJs`更多信息，请访问其官网。<https://github.com/nodejs/docker-node/>

更多使用帮助请阅读`wiki`，其他问题欢迎在`issues`中反馈。