# Debian:jessie base

FROM debian:jessie
MAINTAINER Neil Millard <neil@neilmillard.com>
ENV BTSYNC_VERSION 2.3.8
RUN apt-get update && apt-get install -y curl && apt-get clean && \
    curl -o /usr/bin/btsync.tar.gz && \
    https://download-cdn.getsync.com/${BTSYNC_VERSION}/linux-x64/BitTorrent-Sync_x64.tar.gz && \
    cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz && \
    mkdir -p /btsync/.sync && mkdir -p /var/run/btsync && mkdir -p /mnt/sync
EXPOSE 55555/tcp
ADD start-btsync /usr/bin/start-btsync
RUN chmod +x /usr/bin/start-btsync
VOLUME /mnt/sync
ENTRYPOINT start-btsync
