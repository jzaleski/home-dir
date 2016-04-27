#!/usr/bin/env bash

if ! hash svn 2> /dev/null; then
  echo "Could not locate the \"svn\" binary";
  exit 1;
fi

if [ "$1" = "reviewboard" ]; then
  \svn diff "${@:2}";
else
  \svn "$@";
fi
