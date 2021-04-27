#!/usr/bin/env bash

sed_cmd=$(which gsed 2> /dev/null || which sed 2> /dev/null || echo -n);
if [ -z "$sed_cmd" ]; then
  echo "Could not locate the \"[g]sed\" binary";
  exit 1;
fi

$sed_cmd "$@";
