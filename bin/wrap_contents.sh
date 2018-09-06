#!/bin/bash

CONTENT_FILE=$1
WRAP_NAME=$2
RESULT_NAME=$3

cat ${WRAP_NAME}_header.html $CONTENT_FILE ${WRAP_NAME}_footer.html > $RESULT_NAME
