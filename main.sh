#!/usr/bin/bash

hass --open-ui &

service nginx start &

duckdns/duck.sh