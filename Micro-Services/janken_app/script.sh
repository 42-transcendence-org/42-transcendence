#!/bin/bash

(sleep 5 && python manage.py migrate) &
uvicorn janken_app.asgi:application --host 0.0.0.0 --port 8000