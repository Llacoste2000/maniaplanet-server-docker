#!/bin/bash

xmlstarlet ed --inplace -u "maniacontrol/server/host" -v "$DEDICATED_SERVER_IP" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/server/port" -v "$DEDICATED_SERVER_XMLRPC_PORT" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/server/user" -v "$DEDICATED_SERVER_XMLRPC_USER" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/server/pass" -v "$DEDICATED_SERVER_XMLRPC_USER_PASSWORD" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/database/host" -v "$DATABASE_IP" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/database/port" -v "$DATABASE_PORT" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/database/user" -v "$DATABASE_USER" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/database/pass" -v "$DATABASE_USER_PASSWORD" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/database/name" -v "$DATABASE_NAME" configs/server.xml
xmlstarlet ed --inplace -u "maniacontrol/masteradmins/login" -v "$MASTERADMIN_LOGIN" configs/server.xml

php ManiaControl.php