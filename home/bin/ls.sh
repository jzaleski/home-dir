#!/usr/bin/env bash

if [ `uname` = "Darwin" ]; then
  color_arg='-G';
else
  color_arg='--color';
fi

ls $color_arg "$@";
