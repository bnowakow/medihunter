#!/bin/bash

source secrets.sh

source ./env/bin/activate
pip install --editable .
