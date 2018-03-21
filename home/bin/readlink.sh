#!/usr/bin/env sh

if \which greadlink > /dev/null 2>&1; then
  readlink_cmd="greadlink";
else
  readlink_cmd="readlink";
fi

$readlink_cmd "$@";
