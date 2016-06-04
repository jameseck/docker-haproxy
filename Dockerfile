FROM jameseckersall/docker-centos-base

MAINTAINER James Eckersall <james.eckersall@gmail.com>

COPY files /
RUN \
  rpm -Uvh https://www.dropbox.com/s/rnvptohx89jmni2/haproxy-1.6.4-1.x86_64.rpm?dl=0 && \
  chmod -R 0755 /hooks/*

EXPOSE 8080 8443
