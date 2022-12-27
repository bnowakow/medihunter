#!/bin/bash

source secrets.sh

person="${1:-kasia}"

# to create venv:
# python3 -m venv venv
source venv/bin/activate
pip install --editable .
pip install -r requirements.txt

sleep_time=7200;
i=0;

while true; do
    date_now=$(date +"%Y-%m-%d");
    echo $date_from;

    if [ $person = "kasia" ]; then
        #echo -n `date`" iteration=$i - Woźny ginekolog -prowadzenie -  ";
        # sometimes -i option doesn't return new finds, making restart app after an hour timeout
        #timeout $sleep_time python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 --start-date 2022-11-27 --end-date 2022-12-07 -n telegram -i 1 &

        date_start="2023-01-13";
        date_end="2023-01-18";
        if [ $(date -d $date_now +%s) -gt $(date -d $date_end +%s) ]; then
            echo "$date_now is past checkpoint of $date_end, exiting";
            #exit # if that's only active search we can kill whole script
        else
            if [ $(date -d $date_now +%s) -gt $(date -d $date_start +%s) ]; then
                echo "$date_now is past $date_start, moving date_start";
                date_start=$date_now;
            fi
            echo "start=$date_start end=$date_end";
            echo -n "Woźny ginekolog  -zwykla - ";
            timeout $sleep_time python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4798 --disable-phone-search --start-date $date_start --end-date $date_end -n telegram -i 1 &
        fi

        #echo -n `date`" - Endokrynolog - ";
        #python3 medihunter.py find-appointment --region 200 --specialization 5 -n telegram

        # echo -n "Higienistka - "
        # TODO filter out Telefonicznie
        #python3 medihunter.py find-appointment --specialization 112 --region 200 -n telegram

        #echo -n "Neurolog - "
        #python3 medihunter.py find-appointment --specialization 16 --region 200 --start-date 2022-08-28 --end-date 2022-09-21 -n telegram
    
        #echo -n "Dermatolog Cichowska - ";
        #timeout $sleep_time python3 medihunter.py find-appointment --specialization 3 --doctor 417732 --region 200 --start-date 2022-11-03 --end-date 2022-11-12 --disable-phone-search -n telegram -i 1 &

    fi

    if [ $person = "kuba" ]; then
        #date_from=$(date +"%Y-%m-%d" --date="2 day");
    #    echo "Pediatra dzieci zdrowe - ";
    #    echo -n "$date_from";
    #    timeout $sleep_time python3 medihunter.py find-appointment --region 200 --specialization 132 --start-date $date_from --end-date 2022-12-31 --disable-phone-search -n telegram -i 1 &

        # plus mozna dodac: clinicId=21950 (Grunwaldzka) doctorId=137862 (Bednarski Cezary) i date przed 16.01.2023
        #echo -n "Ortopeda dzieciecy - "
        #timeout $sleep_time python3 medihunter.py find-appointment --region 200 --bookingtype 2 --specialization 83 --start-date $date_now --end-date 2023-12-30 --disable-phone-search -n telegram -i 1 &
    

        # nie mozna zarezerwowac z konta dziecka :/
        #echo -n "Ortopeda dzieci+dorosli - "
        #timeout $sleep_time python3 medihunter.py find-appointment --region 200 --specialization 202 --disable-phone-search -n telegram -i 1 &

        # for some reason when service is used on end date could be set :/
        #echo -n "USG bioder - "    
        #timeout $sleep_time python3 medihunter.py find-appointment --region 200 --bookingtype 1 --service 535 --start-date $date_from  --disable-phone-search -n telegram -i 1 &    
    fi    

    sleep 60;
    sleep $sleep_time;
    let i=$i+1;
done
