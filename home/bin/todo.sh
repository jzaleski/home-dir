#!/usr/bin/env bash

python_cmd=`which python 2> /dev/null`;
python_script="$HOME/lib/todo/todo.py";
if [ -n "$python_cmd" ] && [ -f $python_script ]; then
  $python_cmd $python_script "$@";
  exit $?;
fi

echo "`basename $0`: Could not find a valid executor + script pair";
exit 1;
