#!/usr/bin/env bash

if ! hash screen 2> /dev/null; then
  echo "Could not locate the \"screen\" binary";
  exit 1;
fi

if [ $# -eq 0 ]; then
  \screen -r > /dev/null 2>&1 || \screen;
else
  \screen "$@";
fi
