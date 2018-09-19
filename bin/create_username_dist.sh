#!/bin/bash

directory=$1

raw_username_data=`mktemp`

# Get username column from all failed_login_data.txt files and count occurrences. Make a JS snippet.
cat $directory/*/failed_login_data.txt | \
	awk '{print $4}' | sort | uniq -c | \
	sed -r 's/ *([0-9]+) (.+)/data.addRow(\[\x27\2\x27, \1\]);/' > \
	$raw_username_data

# wrap everything in the appropriate header/footer and write to a .html
bin/wrap_contents.sh $raw_username_data html_components/username_dist $directory/username_dist.html

rm $raw_username_data


