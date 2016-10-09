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
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    curl -o /usr/bin/btsync.tar.gz \
    https://download-cdn.getsync.com/${BTSYNC_VERSION}/linux-x64/BitTorrent-Sync_x64.tar.gz && \
    cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz && \
    mkdir -p /btsync/.sync && mkdir -p /var/run/btsync && mkdir -p /mnt/sync
EXPOSE 55555/tcp
ADD start-btsync /usr/bin/start-btsync
RUN chmod +x /usr/bin/start-btsync
VOLUME /mnt/sync
ENTRYPOINT start-btsync
