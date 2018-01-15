#!/usr/bin/env bash

if [ -n "$TYPE" ]; then
  type=$TYPE;
elif [ -n "$1" ]; then
  type=$1;
fi

if [[ $type =~ ^node ]]; then
  echo $type > $PWD/.node-version;
elif [[ $type =~ ^python ]]; then
  echo $type > $PWD/.python-version;
elif [[ $type =~ ^[j]?ruby ]]; then
  echo $type > $PWD/.ruby-version;
else
  echo "Invalid environment-type: \"$type\"";
fi

source $HOME/bin/workon.sh .;
