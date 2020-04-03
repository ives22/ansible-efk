#!/bin/bash
#Desc: Copy elasticsearch+fluentd+backend software package to ansible roles dir
efk="efkpackage.tar.gz"
md5="caab1f3677a176d652ff2419b8df142d"
if [ -f "/root/package/${efk}" ] && [ `md5sum /root/package/${efk} |awk '{print $1}'` == ${md5} ]; then
    echo "正在将软件包copy到ansible-roles相应目录,请稍等..."
    tar xf /root/package/efkpackage/es.tar.gz -C ./roles/elasticsearch/files/ && \
    tar xf /root/package/efkpackage/fluentd.tar.gz -C ./roles/fluentd/files/ && \
    cp /root/package/efkpackage/jdk-8u211-linux-x64.rpm ./roles/jdk/files/ &&\
    cp /root/package/efkpackage/kibana-6.8.1-x86_64.rpm ./roles/kibana/files/
    echo "软件包已准备完毕，可以执行playbook"
else
    echo "请检查${efk}软件包是否存在/root/package目录，并且是否为正确的软件包" && exit
fi
