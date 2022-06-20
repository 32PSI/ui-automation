#!/bin/bash
echo "Starting deployment on $1 Enviroment"
screen -XS $1 quit $ > /dev/null 2>&1
if [ $1 == 'stage' ]
then
    export NODE_PORT=4567
else
    export NODE_PORT=3000
fi
screen -S $1 -dm node ./index.js
if [ $? -eq 0 ]
then
    echo "Success of stage Deploy, Enviroment $1"
    sh ../send_notification.sh "$1 deploy" 0
    exit 0
else
    echo "Failure of stage Deploy, Enviroment $1"
    sh ../send_notification.sh "$1 deploy" 1
    exit 1
fi