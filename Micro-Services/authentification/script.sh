#!/bin/bash

(sleep 15 && python manage.py migrate auth_app) &
uvicorn --reload authentification.asgi:application --host 0.0.0.0 --port 8000