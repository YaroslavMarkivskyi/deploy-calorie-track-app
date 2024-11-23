#!/bin/sh

set -e

python manage.py wait_for_db
python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate
python manage.py add_food_data
gunicorn --bind :9000 --workers 4 app.wsgi