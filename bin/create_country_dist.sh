#!/bin/bash

directory=$1

raw_country_data=mktemp

cat $directory/*/failed_login_data.txt
