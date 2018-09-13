#!/bin/bash

#TODO Write create_hours_dist.sh

directory=$1

raw_hours_data=mktemp

cat $directory/*/failed_login_data.txt | \
	awk '{print $3}' | sort | uniq -c | \
	awk '{print "data.addRow([\x27" $2 "\x27, " $1 "]);" }' > \
	$raw_hours_data

bin/wrap_contents.sh $raw_hours_data html_components/hours_dist $directory/hours_dist.html

rm $raw_hours_data
