#!/usr/bin/env bash

vim_cmd=$(which vim 2> /dev/null || echo -n);
if [ -z "$vim_cmd" ]; then
  echo "Could not locate \"vim\" binary";
  exit 1;
fi

$vim_cmd "$@";
