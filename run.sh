#!/bin/bash

source secrets.sh

./env/bin/activate
pip install --editable .

while true; do
    echo -n `date`" - Woźny ginekolog - ";
    #python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 -n telegram --start-date 2022-07-01 --end-date 2022-07-04 -i 1
    python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 -n telegram --start-date 2022-08-01

    # echo -n "Higienistka - "
    # TODO filter out Telefonicznie
    #python3 medihunter.py find-appointment --specialization 112 --region 200 -n telegram
    
    sleep 60;
done
