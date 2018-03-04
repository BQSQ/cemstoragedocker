# 使用说明

## 容器说明

该容器并没有封装oracle11g,只是一个centos7系统，然后加入了安装oracle11g的默认脚本。

pull下来后需要自己下载oracle11g数据库文件，解压后映射到容器/install下。

``` text
数据库默认信息：
数据库用户:SYS/oracle
端口:1521
SID:orc

系统用户:
root/install
oracle/install
```

## 容器使用

[参考教程](http://fingersnow.cn/2018-01-27/docker%E8%87%AA%E5%8A%A8%E7%BC%96%E8%AF%91oracle11g/)
