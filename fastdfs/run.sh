#!/bin/bash

sed -i 's/tracker_server=.*/tracker_server='`hostname`':22122/g' /etc/fdfs/storage.conf
/usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf

