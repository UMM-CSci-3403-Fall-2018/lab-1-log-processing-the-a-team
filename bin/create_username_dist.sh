#!/bin/bash

directory=$1

cat $directory/*/failed_login_data.txt | awk '{print $4}' | sort | uniq -c | sed -r 's/ *([0-9]+) ([a-zA-Z0-9]+)/data.addRow(\[\x27\2\x27, \1\]);/' > $directory/raw_username_data.html


bin/wrap_contents.sh $directory/raw_username_data.html html_components/username_dist $directory/username_dist.html


