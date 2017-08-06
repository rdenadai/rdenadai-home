import os

vars = []
vars.append(('ELEVATION', os.get('ELEVATION')))
vars.append(('LAT', os.get('LAT')))
vars.append(('LNG', os.get('LNG')))
vars.append(('OPEN_WEATHER_KEY', os.get('OPEN_WEATHER_KEY')))
vars.append(('SERVER_NAME', os.get('SERVER_NAME')))
vars.append(('TIMEZONE', os.get('TIMEZONE')))
vars.append(('SERVER_NAME', os.get('SERVER_NAME')))

with open('configuration.yaml', 'r') as hr:
    with open('/home/.homeassistant/configuration.yaml', 'w') as hw:
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