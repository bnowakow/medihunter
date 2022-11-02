#!/bin/bash

rm scheduled-medihunter.jar
kotlinc scheduled-medihunter.kt -include-runtime -d scheduled-medihunter.jar
java -jar scheduled-medihunter.jar

exit

source secrets.sh

./env/bin/activate
pip install --editable .

while true; do
    echo -n `date`" - Woźny ginekolog - ";
    #python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 -n telegram --start-date 2022-07-01 --end-date 2022-07-04 -i 1
    # sometimes -i option doesn't return new finds, making restart app after an hour timeout
    timeout 7200 python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 -n telegram -i 1 
    #python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 -n telegram

    #echo -n `date`" - Endokrynolog - ";
    #python3 medihunter.py find-appointment --region 200 --specialization 5 -n telegram

    # echo -n "Higienistka - "
    # TODO filter out Telefonicznie
    #python3 medihunter.py find-appointment --specialization 112 --region 200 -n telegram

    #echo -n "Neurolog - "
    #python3 medihunter.py find-appointment --specialization 16 --region 200 --start-date 2022-08-28 --end-date 2022-09-21 -n telegram
    
    echo -n "Dermatolog Cichowska- "
    python3 medihunter.py find-appointment --specialization 3 --doctor 417732 --region 200 --start-date 2022-11-03 --end-date 2022-11-12 --disable-phone-search -n telegram 

    sleep 60;
done
