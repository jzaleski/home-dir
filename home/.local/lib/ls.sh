#!/usr/bin/env bash

if [ $(uname) = "Darwin" ]; then
  color_arg="--color";
else
  color_arg="--color=auto";
fi

\ls ${color_arg} "$@";
