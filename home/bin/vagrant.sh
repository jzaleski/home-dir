#!/usr/bin/env bash

vagrant_cmd=`which vagrant`;
if [ -z "$vagrant_cmd" ]; then
  echo "Could not locate the \"vagrant\" binary";
  exit 1;
fi

$vagrant_cmd `echo ${@:1} | sed 's/down/halt/'`;
