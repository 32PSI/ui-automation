#!/bin/bash
npm install
if [ $? -eq 0 ]
then
    echo "Success of stage BUILD, Enviroment $1"
    sh ../send_notification.sh "$1 build" 0
    exit 0
else
    echo "Failure of stage BUILD, Enviroment $1"
    sh ../send_notification.sh "$1 build" 1
    exit 1
fi