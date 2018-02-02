# Dockerfile
主要是一些docker编译的文件
## 快速创建自定义的Docker镜像   
DockerFile分为四部分组成：基础镜像信、维护者信息、镜像操作指令和容器启动时执行指令，例如：
```
#第一行必须指令基于的基础镜像
From ubutu

#维护者信息
MAINTAINER docker_user  docker_user@mail.com

#镜像的操作指令
apt/sourcelist.list

RUN apt-get update && apt-get install -y ngnix 
RUN echo "\ndaemon off;">>/etc/ngnix/nignix.conf

#容器启动时执行指令
CMD /usr/sbin/ngnix
```
[个人主页](http://fingersnow.cn)
