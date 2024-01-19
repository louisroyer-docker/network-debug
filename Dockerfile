# Copyright 2024 Louis Royer. All rights reserved.
# Use of this source code is governed by a MIT-style license that can be
# found in the LICENSE file.
# SPDX-License-Identifier: MIT

FROM louisroyer/base-irit

LABEL maintainer="Louis Royer <louis.royer@irit.fr>" \
      org.opencontainers.image.authors="Louis Royer <louis.royer.irit.fr>" \
      org.opencontainers.image.source="https://github.com/louisroyer-docker/network-debug"

# Used to disable caching of next steps, if not build since 1 day
# allowing to search and apply security upgrades
ARG BUILD_DATE=""

RUN apt-get update -q && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
    bind9-dnsutils \
    curl \
    docker-setup \
    ethtool \
    iperf3 \
    iproute2 \
    iptables \
    iputils-ping \
    make \
    tshark \
    wget \
    wireshark-ueransim-rls \
    && apt-get upgrade -qy \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["docker-setup"]
