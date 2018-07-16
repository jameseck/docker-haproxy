FROM alpine

MAINTAINER James Eckersall <james.eckersall@gmail.com>

COPY files /

RUN \
  apk update && apk add bash haproxy supervisor rsyslog && \
  [ "$(ls -A /hooks 2>/dev/null)" ] && chmod 0755 /init/* /hooks/* || true && \
  rm /etc/haproxy/haproxy.cfg && \
  mkdir -p /var/run/rsyslog/dev /tmp/sockets

ENTRYPOINT ["/bin/bash", "-e", "/init/entrypoint"]
CMD ["run"]
