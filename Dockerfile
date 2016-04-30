# AlpineLinux with glibc
#  -  https://www.gnu.org/software/libc/
#  -  https://github.com/andyshinn/alpine-pkg-glibc

FROM alpine:latest
MAINTAINER Neil Millard <neil@neilmillard.com>
ENV GLIBC_VERSION 2.23-r1
RUN apk add --update curl ca-certificates bash && \
    curl -o /tmp/glibc.apk -L "https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
    apk add --allow-untrusted /tmp/glibc.apk && \
    curl -o /tmp/glibc-bin.apk -L "https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
    apk add --allow-untrusted /tmp/glibc-bin.apk && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc/usr/lib && \
    rm -rf /tmp/* /var/cache/apk/* &&  \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf
RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz
RUN mkdir -p /btsync/.sync
RUN mkdir -p /var/run/btsync
RUN mkdir -p /data
EXPOSE 8888/tcp
EXPOSE 55555/tcp
ADD start-btsync /usr/bin/start-btsync
RUN chmod +x /usr/bin/start-btsync
VOLUME /data
ENTRYPOINT start-btsync
