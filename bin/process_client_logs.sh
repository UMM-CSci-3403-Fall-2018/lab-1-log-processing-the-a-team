#!/bin/bash

#TODO Write process_client_logs.sh

directory=$1

cd $directory/var/log

# grep: find all lines in all secure* files logging a failed password attempt
# 1st sed: remove "invalid user" where it occurs to obtain consistent lines
# 2nd sed: regex to obtain month, day, hour, username, and IP address
# cat: dump the cleaned up columns into failed_login_data.txt (used later by create_*_dist.sh)
cat secure* | \
	grep "Failed password" | \
	sed -r 's/invalid user //' | \
	sed -r 's/([a-zA-Z]+) *([0-9]{1,2}) ([0-9]{1,2}):.*:.*Failed password for (.+) from (.*) port [0-9]+ ssh2/\1 \2 \3 \4 \5/' | \
	cat > ../../failed_login_data.txt
