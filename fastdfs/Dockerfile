
FROM centos:6

LABEL author="dingyongbiao"
LABEL e-mail="dingyongbiao123@163.com"
LABEL version="1.0"
LABEL description="fastdfs docker provide storage service"


#
RUN yum update -y && yum -y install gcc perl wget zip unzip make libpng-devel libjpeg-devel

#download file
WORKDIR /opt
COPY ./file/* ./ 
RUN mkdir -p /home/fastdfs

#unzip 
RUN unzip libfastcommon-master.zip \
    && tar -zxvf fastdfs_V5.05.tar.gz

WORKDIR /opt/libfastcommon-master 
#install libfastcommon-master lib
RUN /opt/libfastcommon-master/make.sh \
    && /opt/libfastcommon-master/make.sh install

#install fastdfs-5.05
#tracker and storage service
WORKDIR /opt/fastdfs-5.05/
RUN /opt/fastdfs-5.05/make.sh \
    && /opt/fastdfs-5.05/make.sh install 
WORKDIR /etc/fdfs 
RUN cp /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf \
    && sed -i 's:base_path=.*:base_path=/home/fastdfs:g' /etc/fdfs/tracker.conf \
    && cp /etc/fdfs/storage.conf.sample /etc/fdfs/storage.conf \
    && cp /opt/fastdfs-5.05/conf/http.conf /etc/fdfs/ \
    && cp /opt/fastdfs-5.05/conf/mime.types /etc/fdfs/ \
    && sed -i 's:base_path=.*:base_path=/home/fastdfs:g' /etc/fdfs/storage.conf \
    && sed -i 's:store_path0=.*:store_path0=/home/fastdfs:g' /etc/fdfs/storage.conf 



VOLUME [ "/home/fastdfs" ]
RUN mkdir -p  /runner
EXPOSE 22122 23000
WORKDIR /runner
COPY run.sh run.sh
RUN chmod 755 *.sh
CMD ["./run.sh"]
