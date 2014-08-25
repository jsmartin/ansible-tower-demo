#! /bin/bash -e

sed -i 's,enabled=1,enabled=0,g' /etc/yum/pluginconf.d/fastestmirror.conf
sed -i  's,mirrorlist,#mirrorlist,g' /etc/yum.repos.d/*
sed -i  's,\#baseurl,baseurl,g' /etc/yum.repos.d/*