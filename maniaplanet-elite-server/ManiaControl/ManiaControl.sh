#!/bin/sh
while [ -z $(pgrep php) ]
do
    php ManiaControl.php >ManiaControl.log 2>&1 &
    echo $! > ManiaControl.pid

    sleep 5
done