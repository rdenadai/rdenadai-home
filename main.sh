#!/bin/bash

echo "Python main.py environment vars."

python /usr/src/app/main.py

echo "Starting Home Assistant."

hass &

echo "Starting jupyter notebooks."

jupyter notebook --ip=localhost --port=8585 --no-browser -y --allow-root &

echo "Restarting nginx."

service nginx restart

echo "Duckdns magic!"

/root/duckdns/duck.sh &