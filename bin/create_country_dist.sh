#!/bin/bash

directory=$1

raw_country_data=`mktemp`
ips_and_countries=etc/country_IP_map.txt

# get failed_login_data.txt files from all machines, grab the IP addresses and use the given reference file to join IPs with countries. Make a nice JS line at the end.
cat $directory/*/failed_login_data.txt | \
       	awk '{print $5}' | \
	sort | \
	join -1 1 -2 1 - $ips_and_countries | \
	awk '{print $2}' | \
	sort | \
	uniq -c | \
	awk '{print "data.addRow([\x27" $2 "\x27, " $1 "]);" }' > \
	$raw_country_data

# wrap everything in the appropriate header/footer and write to a .html
bin/wrap_contents.sh $raw_country_data html_components/country_dist $directory/country_dist.html
