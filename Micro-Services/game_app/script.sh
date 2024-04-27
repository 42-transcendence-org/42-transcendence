#!/bin/bash

(sleep 15 && python manage.py migrate game_app) &
uvicorn --reload game_app.asgi:application --host 0.0.0.0 --port 8000