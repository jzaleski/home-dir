#!/usr/bin/env bash

btop_cmd=$(which btop 2> /dev/null || echo -n);
if [ -z "$btop_cmd" ]; then
  echo "Could not locate the \"btop\" binary";
  exit 1;
fi

if [ $(uname) = "Darwin" ]; then
  btop_cmd="sudo $btop_cmd";
fi

$btop_cmd "$@";
