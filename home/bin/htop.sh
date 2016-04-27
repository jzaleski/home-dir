#!/usr/bin/env bash

if ! hash htop 2> /dev/null; then
  echo "Could not locate the \"htop\" binary";
  exit 1;
fi

if [ `uname` = "Darwin" ]; then
  htop_cmd="sudo htop";
else
  htop_cmd="htop";
fi

$htop_cmd "$@";
