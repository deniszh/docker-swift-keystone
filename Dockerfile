# This file is part of docker-swift-keystone.
# https://github.com/globocom/docker-swift-keystone
# https://github.com/MorrisJobke/docker-swift-onlyone

# Licensed under the MIT license:
# http://www.opensource.org/licenses/MIT-license
# Copyright (c) 2018, Globo.com (http://globo.com)

FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    supervisor swift python-swiftclient rsync \
    swift-proxy swift-object memcached python-keystoneclient \
    python-swiftclient swift-plugin-s3 python-netifaces \
    python-xattr python-memcache python-setuptools python-wheel \
    swift-account swift-container swift-object pwgen \
    build-essential \
    python-dev \
    autoconf \
    automake \
    libtool \
    python-pip \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor
ADD files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD files/dispersion.conf /etc/swift/dispersion.conf
ADD files/rsyncd.conf /etc/rsyncd.conf
ADD files/swift.conf /etc/swift/swift.conf
ADD files/proxy-server.conf /etc/swift/proxy-server.conf
ADD files/account-server.conf /etc/swift/account-server.conf
ADD files/object-server.conf /etc/swift/object-server.conf
ADD files/container-server.conf /etc/swift/container-server.conf
ADD files/proxy-server.conf /etc/swift/proxy-server.conf
ADD files/startmain.sh /usr/local/bin/startmain.sh
RUN chmod 755 /usr/local/bin/*.sh

RUN pip install wheel keystonemiddleware

COPY proxy-server.conf /etc/swift/proxy-server.conf
COPY setup-keystone.sh /usr/local/bin/setup-keystone.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/setup-keystone.sh"]