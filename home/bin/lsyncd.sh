#!/usr/bin/env bash

if ! hash lsyncd 2> /dev/null; then
  echo "Could not locate the \"lsyncd\" binary";
  exit 1;
fi

if [ `uname` = "Darwin" ]; then
  lsyncd_cmd="sudo lsyncd";
else
  lsyncd_cmd="lsyncd";
fi

$lsyncd_cmd "$@";
