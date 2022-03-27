#!/bin/bash

# Set initial ports
port=27015
ames=28015

for f in install/*.key; do
    x=1
    while [ $x -le 4 ]; do
        key=${f#install/}
        patpee=$(echo "$key" | cut -d'.' -f1 | cut -d'-' -f$x)
        strlen=$(echo -n $patpee | wc -m)
        if [ $strlen -eq 6 ]; then
            PRE=$(echo "$patpee" | cut -c 1-3)
            SUF=$(echo "$patpee" | cut -c 4-6)
            pre=$(grep $PRE static/prefix.txt)
            suf=$(grep $SUF static/suffix.txt)
            patpee=$(echo -$pre$suf)
            FINAL_STR=$(echo ${FINAL_STR#-}$patpee)
        fi
        x=`expr $x + 1`
    done
    docker volume create $FINAL_STR
    cp $f /var/lib/docker/volumes/$FINAL_STR/_data/$key

    docker run -d -p $port:80 -p $ames:$ames/udp --name $FINAL_STR \
    --mount type=volume,source=$FINAL_STR,destination=/urbit \
    tloncorp/urbit:v1.8 /bin/start-urbit --port=$ames

    port=`expr $port + 1`
    ames=`expr $ames + 1`
    mv $f "done/$key"

    FINAL_STR=""
done
