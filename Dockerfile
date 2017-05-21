FROM centos:7
RUN yum update
RUN yum -y install gcc perl wget unzip make libpng-devel libjpeg-devel java-1.8.0-openjdk  java-1.8.0-openjdk-devel
WORKDIR /opt
RUN wget https://github.com/happyfish100/libfastcommon/archive/master.zip
RUN unzip master.zip
WORKDIR /opt/libfastcommon-master
RUN /opt/libfastcommon-master/make.sh
RUN /opt/libfastcommon-master/make.sh install
WORKDIR /opt
RUN wget  https://github.com/happyfish100/fastdfs/archive/V5.05.tar.gz
RUN tar -zxvf /opt/V5.05.tar.gz 
WORKDIR /opt/fastdfs-5.05/
RUN /opt/fastdfs-5.05/make.sh
RUN /opt/fastdfs-5.05/make.sh install
RUN mkdir -p /home/fastdfs
WORKDIR /etc/fdfs
RUN cp /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf
RUN sed -i 's:base_path=.*:base_path=/home/fastdfs:g' /etc/fdfs/tracker.conf

RUN mkdir -p /home/fastdfs
WORKDIR /etc/fdfs
RUN cp /etc/fdfs/storage.conf.sample /etc/fdfs/storage.conf
RUN cp /opt/fastdfs-5.05/conf/http.conf /etc/fdfs/
RUN cp /opt/fastdfs-5.05/conf/mime.types /etc/fdfs/
RUN sed -i 's:base_path=.*:base_path=/home/fastdfs:g' /etc/fdfs/storage.conf
RUN sed -i 's:store_path0=.*:store_path0=/home/fastdfs:g' /etc/fdfs/storage.conf
RUN sed -i 's/tracker_server=.*/tracker_server='`hostname`':22122/g' /etc/fdfs/storage.conf
 
WORKDIR /opt
RUN wget https://mirrors.netix.net/sourceforge/g/gr/graphicsmagick/graphicsmagick/1.3.25/GraphicsMagick-1.3.25.tar.gz
RUN tar -xvzf /opt/GraphicsMagick-1.3.25.tar.gz
WORKDIR /opt/GraphicsMagick-1.3.25/
RUN /opt/GraphicsMagick-1.3.25/configure --without-prel --enable-shared --disable-openmp
RUN make
RUN make install
RUN IM4JAVA_TOOLPATH=/usr/local/bin/gm
RUN cat /etc/profile >> /usr/local/bin/gm
RUN ldconfig
WORKDIR /opt
RUN wget http://apache.fayea.com/tomcat/tomcat-7/v7.0.78/bin/apache-tomcat-7.0.78.tar.gz
RUN tar -zxvf /opt/apache-tomcat-7.0.78.tar.gz
WORKDIR /opt/apache-tomcat-7.0.78
RUN rm -rf /opt/apache-tomcat-7.0.78/webapps/*
RUN mkdir -p  /runner
EXPOSE 8080
WORKDIR /runner
ADD run.sh run.sh
RUN chmod 755 *.sh
CMD ["./run.sh"]
