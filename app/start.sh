#! /bin/bash

cd /app || exit 1

pip3 install -r requirements.txt
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8080