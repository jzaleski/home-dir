#!/usr/bin/env bash

if ! hash colordiff 2> /dev/null; then
  echo "Could not locate the \"colordiff\" binary";
  exit 1;
fi

\colordiff "$@" | less -FX;
