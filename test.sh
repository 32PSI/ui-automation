#!/bin/bash
echo "Starting testing on $1 Enviroment"
docker compose up --exit-code-from mvn-test
if [ $? -eq 0 ] 
then
    echo "Success of stage TEST, Enviroment $1"
    sh ./send_notification.sh "$1 test" 0
    exit 0
else
    echo "Failure of stage TEST, Enviroment $1"
    sh ./send_notification.sh "$1 test" 1
    exit 1
fi