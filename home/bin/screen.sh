#!/usr/bin/env bash

screen_cmd=`\which screen 2> /dev/null`;
if [ -z "$screen_cmd" ]; then
  echo "Could not locate the \"screen\" binary";
  exit 1;
fi

if [ $# -eq 0 ]; then
  $screen_cmd -r > /dev/null 2>&1 || $screen_cmd;
else
  $screen_cmd "$@";
fi
