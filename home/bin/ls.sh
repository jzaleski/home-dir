#!/usr/bin/env bash

ls_cmd=`\which ls 2> /dev/null`;
if [ -z "$ls_cmd" ]; then
  echo "Could not locate the \"ls\" binary";
  exit 1;
fi

if [ `uname` = "Darwin" ]; then
  color_arg="-G";
else
  color_arg="--color";
fi

$ls_cmd $color_arg "$@";
