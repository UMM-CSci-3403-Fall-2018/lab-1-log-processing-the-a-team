#!/bin/bash

directory=$1

cat $directory/*/failed_login_data.txt | awk '{print $4}' | sort | uniq -c | sed -r 's/.*([0-9]+) ([a-zA-Z0-9]+)/data.addRow(\[\x27\2\x27, \1\]);/' | cat > $directory/raw_username_data.html

cd html_components

../bin/wrap_contents.sh raw_username_data.html username_dist $directory/username_dist.html

cd ..
