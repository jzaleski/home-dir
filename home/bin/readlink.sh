#!/usr/bin/env bash

if hash greadlink 2> /dev/null; then
  readlink_cmd="greadlink";
else
  readlink_cmd="readlink";
fi

$readlink_cmd "$@";
