#!/usr/bin/env bash

if ! hash firefox 2> /dev/null; then
  echo "Could not locate the \"firefox\" binary";
  exit 1;
fi

\firefox > /dev/null 2>&1
