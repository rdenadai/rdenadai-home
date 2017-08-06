#!/usr/bin/bash

hass --open-ui &

service nginx start &

jupyter notebook --ip=0.0.0.0 --port=8181 --no-browser &