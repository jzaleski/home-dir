#!/usr/bin/env bash

vim_cmd=`\which nvim 2> /dev/null`;
if [ -z "$vim_cmd" ]; then
  vim_cmd=`\which vim 2> /dev/null`;
fi

if [ -z "$vim_cmd" ]; then
  echo "Could not locate the \"[n]vim\" binary";
  exit 1;
fi

$vim_cmd "$@";
