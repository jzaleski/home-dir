#!/usr/bin/env bash

if ! hash find 2> /dev/null; then
  echo "Could not locate the \"find\" binary";
  exit 1;
fi

if [ $# -eq 1 ] && [ $1 != "." ]; then
  \find . -name $1;
else
  \find "$@";
fi
