#!/bin/bash

python manage.py migrate &
PID=$(echo $!)
sleep 5
kill -9 $PID
uvicorn game_app.asgi:application --host 0.0.0.0 --port 8000