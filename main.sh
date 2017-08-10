#!/bin/bash

echo "Python main.py environment vars."
python /usr/src/app/environment.py
echo "Starting Home Assistant."
/home/pi/.pyenv/shims/hass > /usr/src/app/hass.log &
echo "Starting jupyter notebooks."
/home/pi/.pyenv/shims/jupyter notebook --ip=localhost --port=8585 --no-browser -y --allow-root > /usr/src/app/jupyter.log &
echo "Restarting nginx."
sudo service nginx restart
echo "Duckdns magic!"
/root/duckdns/duck.sh &