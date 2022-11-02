#!/bin/bash

source run-medihunter-single-prefix.sh

source ./env/bin/activate
pip install --editable .

echo -n `date`" - Woźny ginekolog - ";
python3 medihunter.py find-appointment --doctor 325232 --region 200 --specialization 4800 -n telegram -i 1