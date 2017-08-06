import os

vars = []
vars.append(('URL_DUCKDNS', os.getenv('URL_DUCKDNS')))
vars.append(('ELEVATION', os.getenv('ELEVATION')))
vars.append(('LAT', os.getenv('LAT')))
vars.append(('LNG', os.getenv('LNG')))
vars.append(('OPEN_WEATHER_KEY', os.getenv('OPEN_WEATHER_KEY')))
vars.append(('SERVER_NAME', os.getenv('SERVER_NAME')))
vars.append(('TIMEZONE', os.getenv('TIMEZONE')))
vars.append(('SERVER_NAME', os.getenv('SERVER_NAME')))

with open('configuration.yaml', 'r') as hr:
    with open('/root/.homeassistant/configuration.yaml', 'w') as hw:
        f = hr.read()
        for var in vars:
            f.replace('<{}>'.format(var[0]), var[1])
        hw.write(f)

with open('nginx.conf', 'r') as hr:
    with open('/etc/nginx/sites-available/default', 'w') as hw:
        f = hr.read()
        for var in vars:
            f.replace('<{}>'.format(var[0]), var[1])
        hw.write(f)

with open('duckdns.conf', 'r') as hr:
    with open('/root/duckdns/duck.sh', 'w') as hw:
        f = hr.read()
        for var in vars:
            f.replace('<{}>'.format(var[0]), var[1])
        hw.write(f)