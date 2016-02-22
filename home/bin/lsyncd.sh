#!/usr/bin/env bash

lsyncd_cmd=`\which lsyncd 2> /dev/null`;
if [ -z "$lsyncd_cmd" ]; then
  echo "Could not locate the \"lsyncd\" binary";
  exit 1;
fi

if [ `uname` = "Darwin" ]; then
  lsyncd_cmd="sudo $lsyncd_cmd";
fi

$lsyncd_cmd "$@";
