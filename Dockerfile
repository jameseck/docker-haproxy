FROM jameseckersall/docker-centos-base

MAINTAINER James Eckersall <james.eckersall@gmail.com>

RUN rpm -Uvh https://www.dropbox.com/s/rnvptohx89jmni2/haproxy-1.6.4-1.x86_64.rpm?dl=0

COPY hooks/ /hooks/
COPY haconfig.sh /haconfig.sh
COPY supervisord.d/ /etc/supervisord.d/
COPY haproxy/conf.d/ /etc/haproxy/conf.d/
