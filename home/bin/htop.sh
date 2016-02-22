#!/usr/bin/env bash

htop_cmd=`\which htop 2> /dev/null`;
if [ -z "$htop_cmd" ]; then
  echo "Could not locate the \"htop\" binary";
  exit 1;
fi

if [ `uname` = "Darwin" ]; then
  sudo $htop_cmd;
else
  $htop_cmd;
fi
