# ManiaPlanet full server for docker

This Maniaplanet gaming server is made to fit inside a Docker container.

## Summary

- Quick start
- Using docker-compose
- Configurations
- Environment variables

## Quick start

## Using docker-compose

## Configurations

## Environment variables

> Variables with a * means they must be setted

`DEDICATED_SERVER_ACCOUNT`* = login of your dedicated server account

`DEDICATED_SERVER_ACCOUNT_PASSWORD`* = password of your dedicated server account

`USER_VALIDATION_KEY` = your main account validation key for planets donations

`SERVER_NAME` = name of the server (default = A maniaplanet server)

`SERVER_MAX_PLAYERS` = max playing players allowed on the server (default = 6)

`SERVER_PASSWORD` = password to join the server as a player

`SERVER_MAX_SPECTATORS` = max spectators allowed on the server (default = 15)

`SERVER_SPECTATORS_PASSWORD` = password to join the server as a spectator

`SERVER_PORT` = server port (default = 2350)

`SERVER_P2P_PORT` = server P2P port (default = 3450)

`SERVER_XMLRPC_PORT` = server xmlrpc port used for maniacontrol (default = 5000)

`SERVER_TITLE_PACK` = complete name of the server title pack (default = SMStorm)

`MANIACONTROL_DATABASE_HOST` = IP address or URL of the database (default: localhost)

`MANIACONTROL_DATABASE_PORT` = port of the database (default: 3306)

`MANIACONTROL_DATABASE_USER`* = database user login

`MANIACONTROL_DATABASE_PASSWORD`* = database user password

`MANIACONTROL_DATABASE_NAME`* = database name

`MANIACONTROL_MASTERADMIN_LOGIN`* = maniaplanet login of the masteradmin for this server

