#!/usr/bin/bash

python /usr/src/app/main.py

service nginx start &

hass --open-ui &

jupyter notebook --ip=0.0.0.0 --port=8181 --no-browser -y &

/root/duckdns/duck.sh &