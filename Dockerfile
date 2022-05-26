FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG SERVER_NAME
ARG DEDICATED_USERNAME
ARG DEDICATED_PASSWORD
ARG DATABASE_NAME

ENV servername=${SERVER_NAME}
ENV dedicatedusername=${DEDICATED_USERNAME}
ENV dedicatedpassword=${DEDICATED_PASSWORD}
ENV databasename=${DATABASE_NAME}

WORKDIR "/home/maniaplanet"
ADD maniaplanet-elite-server /home/maniaplanet

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget unzip curl php php-mysqli php-curl php-xmlrpc php-zip php-xml php-mbstring git xmlstarlet

RUN xmlstarlet edit --update "maniacontrol/database/name" -v ${databasename} ./ManiaControl/configs/server.xml > ./ManiaControl/configs/server_prod.xml

RUN rm ManiaControl/configs/server.xml && mv ManiaControl/configs/server_prod.xml ManiaControl/configs/server.xml

WORKDIR "/home/server"

CMD cp -r /home/maniaplanet/* /home/server && \
    (cd /home/server/ManiaControl && sh ManiaControl.sh &>/dev/null &) && \
    ./ManiaPlanetServer /nodaemon /title=SMStormElite@nadeolabs /servername=${servername} /login=${dedicatedusername} /password=${dedicatedpassword} /game_settings=MatchSettings/.txt /dedicated_cfg=dedicated_cfg.txt