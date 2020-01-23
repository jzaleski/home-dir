#!/usr/bin/env bash

htop_cmd=$(which htop 2> /dev/null || echo -n);
if [ -z "$htop_cmd" ]; then
  echo "Could not locate the \"htop\" binary";
  exit 1;
fi

if [ $(uname) = "Darwin" ]; then
  htop_cmd="sudo $htop_cmd";
fi

$htop_cmd "$@";
