#!/usr/bin/env bash

nvtop_cmd=$(which nvtop 2> /dev/null || echo -n);
if [ -z "$nvtop_cmd" ]; then
  echo "Could not locate the \"nvtop\" binary";
  exit 1;
fi

if [ $(uname) = "Darwin" ]; then
  nvtop_cmd="sudo $nvtop_cmd";
fi

$nvtop_cmd "$@";
