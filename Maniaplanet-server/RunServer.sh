#!/bin/bash

EXTERNAL_IP=`curl ifconfig.me`

if [ "$GAME_MODE" == "JOUST" ]; then
  MatchSettings="MatchSettings/SMStormJoust1.txt"
  SERVER_TITLE_PACK="SMStormJoust@nadeolabs"
elif  [ "$GAME_MODE" == "ELITE" ]; then
  MatchSettings="MatchSettings/SMStormElite2.txt"
  SERVER_TITLE_PACK="SMStormElite@nadeolabs"
else
 echo "Game mode should be JOUST or ELITE"
 exit
fi

xmlstarlet ed --inplace -u "dedicated/masterserver_account/login" -v "$DEDICATED_SERVER_ACCOUNT" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/masterserver_account/password" -v "$DEDICATED_SERVER_ACCOUNT_PASSWORD" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/masterserver_account/validation_key" -v "$USER_VALIDATION_KEY" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/server_options/name" -v "$SERVER_NAME" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/server_options/max_players" -v "$SERVER_MAX_PLAYERS" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/server_options/password" -v "$SERVER_PASSWORD" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/server_options/max_spectators" -v "$SERVER_MAX_SPECTATORS" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/server_options/password_spectator" -v "$SERVER_SPECTATORS_PASSWORD" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/system_config/server_port" -v "$SERVER_PORT" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/system_config/server_p2p_port" -v "$SERVER_P2P_PORT" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/system_config/xmlrpc_port" -v "$SERVER_XMLRPC_PORT" UserData/Config/dedicated_conf.txt
xmlstarlet ed --inplace -u "dedicated/system_config/title" -v "$SERVER_TITLE_PACK" UserData/Config/dedicated_conf.txt

/opt/maniaplanet/ManiaPlanetServer /nodaemon \
  /dedicated_cfg=dedicated_conf.txt \
  /game_settings=$MatchSettings \