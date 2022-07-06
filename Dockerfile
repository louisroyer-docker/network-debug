FROM louisroyer/base-irit

LABEL maintainer="Louis Royer <louis.royer@irit.fr>" \
      org.opencontainers.image.authors="Louis Royer <louis.royer.irit.fr>" \
      org.opencontainers.image.source="https://github.com/louisroyer-docker/network-debug"

# Used to disable caching of next steps, if not build since 1 day
# allowing to search and apply security upgrades
ARG BUILD_DATE=""

RUN apt-get update -q && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
    curl \
    ethtool \
    iperf3 \
    iproute2 \
    iptables \
    iputils-ping \
    tshark \
    wget \
    wireshark-ueransim-rls 
    && apt-get upgrade -qy \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sleep"]
CMD ["infinity"]
