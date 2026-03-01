#!/usr/bin/env bash

set -e;

open_cmd=$(which open 2> /dev/null || echo -n);
if [ -z "$open_cmd" ]; then
  open_cmd=$(which xdg-open 2> /dev/null || echo -n);
fi

if [ -z "$open_cmd" ]; then
  echo "Could not locate the \"[xdg-]open\" binary";
  exit 1;
fi

gem_name=$1;
if [ -z "$repository" ]; then
  gem_name=$(basename $(pwd));
fi

rubygems_url="https://rubygems.org/gems/$gem_name";

verbose=${VERBOSE:-"false"};
if [ "$verbose" = "true" ]; then
  $open_cmd "$rubygems_url";
else
  $open_cmd "$rubygems_url" > /dev/null 2>&1;
fi
