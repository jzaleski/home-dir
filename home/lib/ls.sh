#!/usr/bin/env bash

export LSCOLORS=${LSCOLORS:-"ExFxBxDxCxegedabagacad"};

if [ $(uname) = "Darwin" ]; then
  color_arg="-G";
else
  color_arg="--color";
fi

\ls $color_arg "$@";
