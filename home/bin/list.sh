#!/usr/bin/env bash

if [ -z "$LIST_NAME" ]; then
  echo "Must specify a \"LIST_NAME\"";
  exit 1;
fi

python_cmd=`\which python 2> /dev/null`;
if [ -z "$python_cmd" ]; then
  echo "Could not locate the \"python\" binary";
  exit 1;
fi

python_script="$HOME/lib/python/utilities/list_processor.py";
if [ ! -f $python_script ]; then
  echo "Could not locate the \"python\" script";
  exit 1;
fi

$python_cmd $python_script "$@";
exit $?;
