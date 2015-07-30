#!/usr/bin/env bash

hipchat_cmd=`\which hipchat 2> /dev/null`;
if [ -z "$hipchat_cmd" ]; then
  echo "Could not locate the \"hipchat\" binary";
  exit 1;
fi

$hipchat_cmd > /dev/null 2>&1
