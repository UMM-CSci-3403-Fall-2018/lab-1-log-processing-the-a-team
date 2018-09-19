#/bin/bash

here=`pwd`
directory=`mktemp -d`
echo $directory

for tar_file in "$@"
do
	# untar each file given and save in its own subdirectory in the temp directory
	mkdir $directory/`basename $tar_file "_secure.tgz"`
	tar -xzf $tar_file -C $directory/`basename $tar_file "_secure.tgz"`
	# obtain failed_login_data.txt for each machine via process_client_logs
	bin/process_client_logs.sh $directory/`basename $tar_file "_secure.tgz"`
done

# make a bunch of html files and assemble them together at the end
bin/create_username_dist.sh $directory
bin/create_hours_dist.sh $directory
bin/create_country_dist.sh $directory
bin/assemble_report.sh $directory

# put the result where we started
mv $directory/failed_login_summary.html $here/failed_login_summary.html

rm -rf $directory
