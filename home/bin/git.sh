#!/usr/bin/env bash

if ! hash git 2> /dev/null; then
  echo "Could not locate the \"git\" binary";
  exit 1;
fi

if [ "$1" = "reviewboard" ]; then
  \git diff --full-index "${@:2}";
else
  \git "$@";
fi
