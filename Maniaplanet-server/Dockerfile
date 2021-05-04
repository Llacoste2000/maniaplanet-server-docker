FROM ubuntu:20.04

ENV SERVER_NAME="A Maniaplanet Server"
ENV SERVER_MAX_PLAYERS=6
ENV SERVER_MAX_SPECTATORS=15
ENV SERVER_PORT=2350
ENV SERVER_P2P_PORT=3450

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y xmlstarlet wget unzip curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/maniaplanet
RUN wget http://files.v04.maniaplanet.com/server/ManiaplanetServer_Latest.zip -nv && \
    unzip ManiaplanetServer_Latest.zip && \
    rm ManiaplanetServer_Latest.zip

WORKDIR /opt/maniaplanet/Packs
RUN wget https://files-v4.live.maniaplanet.com/titles/8cccd36ac4/SMStormElite@nadeolabs.Title.Pack.gbx -nv
RUN wget https://files-v4.live.maniaplanet.com/titles/1e0c6e532d/SMStormJoust@nadeolabs.Title.Pack.gbx -nv

WORKDIR /opt/maniaplanet
COPY RunServer.sh RunServer.sh
COPY dedicated_conf.template.xml UserData/Config/dedicated_conf.txt
COPY matchsettings/* UserData/Maps/MatchSettings/
COPY Maps/Elite/* UserData/Maps/Elite/
COPY Maps/Joust/* UserData/Maps/Joust/

EXPOSE 5000

CMD ./RunServer.sh

VOLUME [ "/opt/maniaplanet" ]