#!/usr/bin/env bash

pidgin_cmd=`\which pidgin 2> /dev/null`;
if [ -z "$pidgin_cmd" ]; then
  echo "Could not locate the \"pidgin\" binary";
  exit 1;
fi

$pidgin_cmd > /dev/null 2>&1;
