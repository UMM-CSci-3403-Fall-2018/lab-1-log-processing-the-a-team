#!/bin/bash

#TODO Write process_client_logs.sh

directory =$1

cd $directory/var/log

cat secure* > failed_logins_raw.txt	

