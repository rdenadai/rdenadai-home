#!/bin/bash

# Generate a cert
acme.sh --issue -d <SERVER_NAME> --dns

# We get the TXT from command above and then put it bellow in <TXT>
https://www.duckdns.org/update?domains=<SERVER_NAME>&token=<DUCKDNS_TOKEN>&txt=<TXT>

# Check if TXT its updated
dig -t txt _acme-challenge.<SERVER_NAME>

# After the above
acme.sh --renew -d <SERVER_NAME>
