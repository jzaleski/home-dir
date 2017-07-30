#!/usr/bin/env bash

if [ -n "$TYPE" ]; then
  type=$TYPE;
elif [ -n "$1" ]; then
  type=$1;
fi

mkenv $type > /dev/null 2>&1;

last_exit_code=$?;
if [ $last_exit_code -ne 0 ]; then
  echo "Invalid environment-type: \"$type\"";
  return;
fi

source $HOME/bin/workon.sh .;
