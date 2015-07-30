#!/usr/bin/env bash

firefox_cmd=`\which firefox 2> /dev/null`;
if [ -z "$firefox_cmd" ]; then
  echo "Could not locate the \"firefox\" binary";
  exit 1;
fi

$firefox_cmd > /dev/null 2>&1
