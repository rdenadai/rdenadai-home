#!/bin/bash

python /usr/src/app/main.py

hass --open-ui &

service nginx restart

jupyter notebook --ip=0.0.0.0 --port=8585 --no-browser -y --allow-root &

/root/duckdns/duck.sh &