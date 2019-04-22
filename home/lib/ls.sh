#!/usr/bin/env bash

ls_cmd=`\which ls 2> /dev/null`;
if [ -z "$ls_cmd" ]; then
  echo "Could not locate the \"ls\" binary";
  exit 1;
fi

LSCOLORS=${LSCOLORS-ExFxBxDxCxegedabagacad} $ls_cmd --color "$@";
