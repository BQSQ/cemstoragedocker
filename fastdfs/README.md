# 使用说明

## 文件位置

服务器映射地址（自定义）：/home/fastdfs
容器中文件存储和日志目录：/home/fastdfs

## 容器说明

tracker端口是22122，storage端口是23000。
容器系统没有重置root密码，可以自己exec进入后设置。

## 容器启动

启动命令示例

``` shell
docker run -it -d --privileged=true --restart=always --name storage-test -p 22122:22122 -p 23000:23000 -v /home/fastdfs:/home/fastdfs fingersnow/storage
```
