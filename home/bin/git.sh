#!/usr/bin/env bash

git_cmd=`\which git 2> /dev/null`;
if [ -z "$git_cmd" ]; then
  echo "Could not locate the \"git\" binary";
  exit 1;
fi

if [ "$1" = "reviewboard" ]; then
  $git_cmd diff --full-index "${@:2}";
else
  $git_cmd "$@";
fi
