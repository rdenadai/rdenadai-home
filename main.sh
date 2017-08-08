#!/bin/bash

echo "Modprobe i2c-dev."

modprobe i2c-dev

echo "Modprobe bcm2835-v4l2."

modprobe bcm2835-v4l2

echo "Python main.py environment vars."

python /usr/src/app/main.py

echo "Starting Home Assistant."

hass --open-ui &

echo "Starting jupyter notebooks."

jupyter notebook --ip=localhost --port=8585 --no-browser -y --allow-root &

echo "Restarting nginx."

service nginx restart

echo "Duckdns magic!"

/root/duckdns/duck.sh &