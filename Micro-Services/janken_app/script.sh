#!/bin/bash

(sleep 15 && python manage.py migrate janken_app) &
uvicorn --reload janken_app.asgi:application --host 0.0.0.0 --port 8000