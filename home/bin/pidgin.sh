#!/usr/bin/env bash

if ! hash pidgin 2> /dev/null; then
  echo "Could not locate the \"pidgin\" binary";
  exit 1;
fi

\pidgin > /dev/null 2>&1;
