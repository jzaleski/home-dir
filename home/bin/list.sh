#!/usr/bin/env bash

if [ -z "$LIST_NAME" ]; then
  echo "Must specify a \"LIST_NAME\"";
  exit 1;
fi

python_cmd=`\which python 2> /dev/null`;
python_script="$HOME/lib/python/utilities/list_processor.py";
if [ -n "$python_cmd" ] && [ -f $python_script ]; then
  $python_cmd $python_script "$@";
  exit $?;
fi

echo "Could not find a valid executor + script pair";
exit 1;
