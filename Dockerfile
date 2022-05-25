FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR "/home/maniaplanet"
ADD maniaplanet-elite-server /home/maniaplanet

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget unzip curl php php-mysqli php-curl php-xmlrpc php-zip php-xml php-mbstring git

WORKDIR "/home/server"

CMD cp -r /home/maniaplanet/* /home/server && \
    ./ManiaPlanetServer /nodaemon /title=SMStormElite@nadeolabs ElitePizzaboysPrivate /game_settings=MatchSettings/.txt /dedicated_cfg=dedicated_cfg.txt