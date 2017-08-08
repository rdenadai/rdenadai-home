#!/bin/bash

modprobe i2c-dev

modprobe bcm2835-v4l2

python /usr/src/app/main.py

hass --open-ui &

service nginx restart

jupyter notebook --ip=localhost --port=8585 --no-browser -y --allow-root &

/root/duckdns/duck.sh &