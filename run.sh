#!/bin/bash

source secrets.sh

./env/bin/activate
pip install --editable .

# Woźny ginekolog
python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 -n telegram --start-date 2022-07-01 --end-date 2022-07-04 -i 1

# Higienistka
#python3 medihunter.py find-appointment --specialization 112 --region 200 -n telegram --start-date 2022-06-18

