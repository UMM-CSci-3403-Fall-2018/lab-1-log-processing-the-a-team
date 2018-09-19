#!/bin/bash

#TODO Write process_client_logs.sh

directory=$1

cd $directory/var/log

cat secure* | grep "Failed password" | sed -r 's/invalid user //' | sed -r 's/([a-zA-Z]+) *([0-9]{1,2}) ([0-9]{1,2}):.*:.*Failed password for (.+) from (.*) port [0-9]+ ssh2/\1 \2 \3 \4 \5/' | cat > ../../failed_login_data.txt
