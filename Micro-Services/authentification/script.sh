#!/bin/bash

(sleep 15 && python manage.py migrate) &
uvicorn authentification.asgi:application --host 0.0.0.0 --port 8000