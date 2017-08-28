#!/usr/bin/env bash

if [ -n "$TYPE" ]; then
  type=$TYPE;
elif [ -n "$1" ]; then
  type=$1;
fi

if [[ $type =~ ^python[2-3]?$ ]]; then
  echo "$(basename $0 .sh) does not currently support: $type";
  exit 1;
fi

$HOME/bin/mkenv.sh $type > /dev/null 2>&1;

last_exit_code=$?;
if [ $last_exit_code -ne 0 ]; then
  echo "Invalid environment-type: \"$type\"";
  return;
fi

source $HOME/bin/workon.sh .;
