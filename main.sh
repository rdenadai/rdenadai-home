#!/usr/bin/bash

hass --open-ui &

jupyter notebook --ip=0.0.0.0 --port=8181 --no-browser &

service nginx start &

/root/duckdns/duck.sh