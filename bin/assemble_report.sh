#!/bin/bash

directory=$1

cat $directory/*_dist.html | bin/wrap_contents.sh - html_components/summary_plots $directory/failed_login_summary.html
