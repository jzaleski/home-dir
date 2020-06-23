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


$open_cmd "https://pypi.org/project/$package_name";
