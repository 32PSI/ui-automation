#!/bin/bash
screen -XS $1 quit
if [ $1 == 'stage' ]
then
    export NODE_PORT=4567
else
    export NODE_PORT=3000
fi
screen -S $1 -dm node ./index.js
