import os


vars = []
for name in ['HOME_ASSISTANT_PASSWORD', 'JUPYTER_PASSWORD', 'SERVER_NAME', 'URL_DUCKDNS', 'ELEVATION', 'LAT', 'LNG', 'OPEN_WEATHER_KEY', 'SERVER_NAME', 'TIMEZONE']:
    vars.append((name, os.getenv(name)))


def make_file(finput, foutput):
    with open(finput, 'r') as hr:
        with open(foutput, 'w') as hw:
            f = hr.read()
            for var in vars:
                f = f.replace('<{}>'.format(var[0]), var[1])
            hw.write(f)


make_file('jupyter_notebook_config.py', '/root/.jupyter/jupyter_notebook_config.py')
make_file('configuration.yaml', '/root/.homeassistant/configuration.yaml')
make_file('nginx.conf', '/etc/nginx/sites-available/default')
make_file('duckdns.conf', '/root/duckdns/duck.sh')