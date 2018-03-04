FROM centos:7

LABEL Author="dingyongbiao123@163.com"
LABEL date="2018-03-04"

ADD assets /assets

RUN chmod -R 755 /assets
RUN /assets/setup.sh

EXPOSE 1521
EXPOSE 8080

VOLUME [ "/install" ]
VOLUME [ "/opt/oracle/" ]

CMD ["/assets/entrypoint.sh"]