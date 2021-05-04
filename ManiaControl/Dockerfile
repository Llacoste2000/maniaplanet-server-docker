FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV DEDICATED_SERVER_XMLRPC_PORT=5000
ENV DEDICATED_SERVER_XMLRPC_USER=SuperAdmin
ENV DEDICATED_SERVER_XMLRPC_USER_PASSWORD=password
ENV DATABASE_PORT=3306

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y xmlstarlet wget unzip curl php php-mysqli php-curl php-xmlrpc php-zip php-xml php-mbstring && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/maniacontrol
RUN wget https://download.maniacontrol.com/beta/ManiaControl_beta_0-256.zip -nv && \
    unzip ManiaControl_beta_0-256.zip && \
    rm ManiaControl_beta_0-256.zip
COPY RunMC.sh RunMC.sh
COPY configs/* configs/

CMD tail -f /dev/null

VOLUME [ "/opt/maniacontrol" ]
