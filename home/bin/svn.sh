#!/usr/bin/env bash

svn_cmd=`\which svn 2> /dev/null`;
if [ -z "$svn_cmd" ]; then
  echo "Could not locate the \"svn\" binary";
  exit 1;
fi

if [ "$1" = "reviewboard" ]; then
  $svn_cmd diff "${@:2}";
else
  $svn_cmd "$@";
fi
