#!/bin/bash

source secrets.sh

./env/bin/activate
pip install --editable .

sleep_time=7200;
i=0;

while true; do
    echo -n `date`" iteration=$i - Woźny ginekolog - ";
    # sometimes -i option doesn't return new finds, making restart app after an hour timeout
    timeout $sleep_time python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 -n telegram -i 1 &

    #echo -n `date`" - Endokrynolog - ";
    #python3 medihunter.py find-appointment --region 200 --specialization 5 -n telegram

    # echo -n "Higienistka - "
    # TODO filter out Telefonicznie
    #python3 medihunter.py find-appointment --specialization 112 --region 200 -n telegram

    #echo -n "Neurolog - "
    #python3 medihunter.py find-appointment --specialization 16 --region 200 --start-date 2022-08-28 --end-date 2022-09-21 -n telegram
    
    echo -n "Dermatolog Cichowska - ";
    timeout $sleep_time python3 medihunter.py find-appointment --specialization 3 --doctor 417732 --region 200 --start-date 2022-11-03 --end-date 2022-11-12 --disable-phone-search -n telegram -i 1 &

    sleep 60;
    sleep $sleep_time;
    let i=$i+1;
done
