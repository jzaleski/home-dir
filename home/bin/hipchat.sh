#!/usr/bin/env bash

if ! hash hipchat 2> /dev/null; then
  echo "Could not locate the \"hipchat\" binary";
  exit 1;
fi

\hipchat > /dev/null 2>&1
