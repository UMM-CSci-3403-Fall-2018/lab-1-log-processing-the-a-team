#!/bin/bash

here=`pwd`
directory=`mktemp -d`

for tar_file in "$@"
do
	tar -xzf $tar_file -C $directory/`basename $tar_file "_secure.tgz"`
	bin/process_client_logs.sh $directory/`basename $tar_file "_secure.tgz"`
done

bin/create_username_dist.sh $directory
bin/create_hours_dist.sh $directory
bin/create_country_dist.sh $directory
bin/assemble_report.sh $directory

mv failed_login_summary.html $here

