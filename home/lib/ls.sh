#!/usr/bin/env bash

ls_cmd=$(which ls 2> /dev/null || echo -n);
if [ -z "$ls_cmd" ]; then
  echo "Could not locate the \"ls\" binary";
  exit 1;
fi

if [ -z "$LSCOLORS" ]; then
  export LSCOLORS="ExFxBxDxCxegedabagacad";
fi

$ls_cmd --color "$@" || $ls_cmd -G "$@";
