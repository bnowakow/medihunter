#!/bin/bash -x

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
        echo "Kasia";
        #echo -n `date`" iteration=$i - Woźny ginekolog -prowadzenie -  ";
        # sometimes -i option doesn't return new finds, making restart app after an hour timeout
        #timeout $sleep_time python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 --start-date 2022-11-27 --end-date 2022-12-07 -n telegram -i 1 &

        #echo -n "Woźny ginekolog  -zwykla - ";
        #timeout $sleep_time python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4798 --disable-phone-search -n telegram -i 1 &

        #date_start="2023-01-13";
        #date_end="2023-01-18";
        #if [ $(date -d $date_now +%s) -gt $(date -d $date_end +%s) ]; then
        #    echo "$date_now is past checkpoint of $date_end, exiting";
        #    #exit # if that's only active search we can kill whole script
        #else
        #    if [ $(date -d $date_now +%s) -gt $(date -d $date_start +%s) ]; then
        #        echo "$date_now is past $date_start, moving date_start";
        #        date_start=$date_now;
        #    fi
        #    echo "start=$date_start end=$date_end";
        #    echo -n "Woźny ginekolog  -zwykla - ";
        #    timeout $sleep_time python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4798 --disable-phone-search --start-date $date_start --end-date $date_end -n telegram -i 1 &
        #fi
        #timeout $sleep_time python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4798 --disable-phone-search -n telegram -i 1 &

        #echo -n `date`" - Endokrynolog - ";
        #python3 medihunter.py find-appointment --region 200 --specialization 5 -n telegram

        #echo -n "Higienistka - "
        #timeout $sleep_time python3 medihunter.py find-appointment --specialization 112 --region 200 --disable-phone-search -n telegram -i 10 &

        #echo -n "Neurolog - Grunwaldzka - "
        #timeout $sleep_time python3 medihunter.py find-appointment --specialization 16 --region 200 --clinic 21950 --disable-phone-search -n telegram -i 1 &
    
        #echo -n "Dermatolog Cichowska - ";
        #timeout $sleep_time python3 medihunter.py find-appointment --specialization 3 --doctor 417732 --region 200 --start-date 2022-11-03 --end-date 2022-11-12 --disable-phone-search -n telegram -i 1 &
        
        #echo -n "Ortopeda Bednarski - ";
        #timeout $sleep_time python3 medihunter.py find-appointment --doctor 137862 --region 200 --specialization 163 --disable-phone-search -n telegram -i 1 &        
        #echo -n "Pobranie krwi - OBC - ";
        #timeout $sleep_time python3 medihunter.py find-appointment --specialization 52106 --region 200 --clinic 21950 --start-date 2023-02-28 --end-date 2023-03-01 --disable-phone-search -n telegram -i 1 &

        echo -n "Express Kukuć - ";
        timeout $sleep_time python3 medihunter.py find-appointment --specialization 16234 --region 200 --doctor 422022 -n telegram -i 10 &        

   fi

    if [ $person = "kuba" ]; then
        echo "Kuba";
        #date_from=$(date +"%Y-%m-%d" --date="2 day");
        #date_to=$(date +"%Y-%m-%d" --date="5 day");
        #echo date_to=$date_to;

        #echo "Pediatra dzieci zdrowe - ";
        #echo -n "$date_from";
        #timeout $sleep_time python3 medihunter.py find-appointment --region 200 --specialization 132 --start-date $date_from --end-date 2022-12-31 --disable-phone-search -n telegram -i 1 &

        #echo -n "Pediatra dzieci chore - ";        
        #timeout $sleep_time python3 medihunter.py find-appointment --region 200 --specialization 158 --start-date $date_from --disable-phone-search -n telegram -i 1 &

        echo -n "Pediatra dzieci chore (OBC) - ";
        timeout $sleep_time python3 medihunter.py find-appointment --region 200 --clinic 21950 --specialization 158 --start-date $date_from --disable-phone-search -n telegram -i 10 &

        echo -n "Pediatra dzieci chore - Dziedzic Magdalena -";
        timeout $sleep_time python3 medihunter.py find-appointment --doctor 469960 --region 200 --specialization 158 --start-date $date_from --disable-phone-search -n telegram -i 10 &

        echo -n "Pediatra dzieci chore - Dorocińska Agnieszka  -";
        timeout $sleep_time python3 medihunter.py find-appointment --doctor 266684 --region 200 --specialization 158 --start-date $date_from --disable-phone-search -n telegram -i 10 &

        #echo -n "Pediatra dyżurny dzieci chore - ";
        #timeout $sleep_time python3 medihunter.py find-appointment --region 200 --bookingtype 2 --specialization 7340 --start-date $date_from --disable-phone-search -n telegram -i 1 &

        # plus mozna dodac: clinicId=21950 (Grunwaldzka) doctorId=137862 (Bednarski Cezary) i date przed 16.01.2023
        #echo -n "Ortopeda dzieciecy - "
        #timeout $sleep_time python3 medihunter.py find-appointment --region 200 --bookingtype 2 --specialization 83 --start-date $date_now --end-date 2023-12-30 --disable-phone-search -n telegram -i 1 &
    
        # for some reason when service is used on end date could be set :/
        #echo -n "USG bioder - "    
        #timeout $sleep_time python3 medihunter.py find-appointment --region 200 --bookingtype 1 --service 535 --start-date $date_from  --disable-phone-search -n telegram -i 1 &    
    fi    

    sleep 60;
    sleep $sleep_time;
    let i=$i+1;
done

