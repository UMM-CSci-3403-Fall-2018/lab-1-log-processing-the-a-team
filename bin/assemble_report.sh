#!/bin/bash

directory=$1

# Wraps all _dist.html snippets into one big html file, the final result.
cat $directory/*_dist.html | bin/wrap_contents.sh - html_components/summary_plots $directory/failed_login_summary.html
