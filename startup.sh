#!/bin/bash
gunicorn app.wsgi:application --bind 0.0.0.0:8080 --workers 2 --timeout 300
