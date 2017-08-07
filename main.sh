#!/bin/bash

hass --open-ui &

sleep 15

kill $(ps aux | grep '.pyenv' | awk '{print $2}')

python /usr/src/app/main.py

service nginx restart

jupyter notebook --ip=0.0.0.0 --port=8585 --no-browser -y --allow-root &

/root/duckdns/duck.sh &