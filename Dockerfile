FROM docker.io/ubuntu:20.04

RUN apt-get update \
  && apt-get install -y iproute2 openssl libuuid1 procps cifs-utils smbclient \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ADD https://cdn.kerio.com/dwn/kerio-control-vpnclient-linux-amd64.deb /tmp/kerio.deb
COPY ./install.sh /tmp/install.sh

RUN bash /tmp/install.sh

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
