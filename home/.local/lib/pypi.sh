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

package_name=$1;
if [ -z "$repository" ]; then
  package_name=$(basename $(pwd));
fi

pypi_url="https://pypi.org/project/$package_name";

verbose=${VERBOSE:-"false"};
if [ "$verbose" = "true" ]; then
  $open_cmd "$pypi_url";
else
  $open_cmd "$pypi_url" > /dev/null 2>&1;
fi
