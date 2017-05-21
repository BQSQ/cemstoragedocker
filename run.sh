#!/bin/bash

sed -i 's/tracker_server=.*/tracker_server='`hostname`':22122/g' /etc/fdfs/storage.conf
/opt/apache-tomcat-7.0.78/bin/startup.sh
/usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf
