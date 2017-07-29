#!/usr/bin/env bash

find_cmd=`\which find 2> /dev/null`;
if [ -z "$find_cmd" ]; then
  echo "Could not locate the \"find\" binary";
  exit 1;
fi

if [ $# -eq 1 ] && [ $1 != "." ]; then
  $find_cmd . -name $1;
else
  $find_cmd "$@";
fi
