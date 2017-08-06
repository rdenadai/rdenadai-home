#!/usr/bin/bash

hass --open-ui &

service nginx start &

/root/duckdns/duck.sh