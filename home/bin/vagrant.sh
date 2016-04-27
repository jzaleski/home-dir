#!/usr/bin/env bash

if ! hash vagrant 2> /dev/null; then
  echo "Could not locate the \"vagrant\" binary";
  exit 1;
fi

\vagrant `echo ${@:1} | sed 's/^down$/halt/' | sed 's/^off$/halt/' | sed 's/^on$/up/'`;
