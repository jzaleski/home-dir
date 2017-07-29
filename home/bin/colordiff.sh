#!/usr/bin/env bash

colordiff_cmd=`\which colordiff 2> /dev/null`;
if [ -z "$colordiff_cmd" ]; then
  echo "Could not locate the \"colordiff\" binary";
  exit 1;
fi

$colordiff_cmd "$@" | less -FX;
