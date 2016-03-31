#!/usr/bin/env bash

vi_cmd=`\which vim 2>/dev/null`;
if [ -z "$vi_cmd" ]; then
  vi_cmd=`\which vi 2> /dev/null`;
fi

if [ -z "$vi_cmd" ]; then
  echo "Could not locate an acceptable \"vi\" binary";
  exit 1;
fi

$vi_cmd "$@";
