#!/usr/bin/env bash

if [ -n "$TYPE" ]; then
  type=$TYPE;
elif [ -n "$1" ]; then
  type=$1;
fi

if [[ $type =~ ^python ]]; then
  $HOME/bin/mkvirtualenv.sh $type true > /dev/null 2>&1;
elif [[ $type =~ ^[j]?ruby$ ]]; then
  $HOME/bin/mkrubyenv.sh $type true > /dev/null 2>&1;
else
  $HOME/bin/mkenv.sh $type > /dev/null 2>&1;
fi

last_exit_code=$?;
if [ $last_exit_code -ne 0 ]; then
  echo "Invalid environment-type: \"$type\"";
  return;
fi

source $HOME/bin/workon.sh .;
