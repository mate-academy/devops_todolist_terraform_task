#!/bin/bash

source /app/venv/bin/activate

/app/venv/bin/python -m pip install --upgrade pip
/app/venv/bin/python -m pip install -r /app/requirements.txt
/app/venv/bin/python /app/manage.py migrate

exec /app/venv/bin/python /app/manage.py runserver 0.0.0.0:8080
