#!/usr/bin/env bash

if [ -n "$TYPE" ]; then
  type=$TYPE;
elif [ $# -ge 1 ]; then
  type=$1;
fi


if [[ $type =~ ^elixir ]]; then
  echo $type > $PWD/.exenv-version;
elif [[ $type =~ ^node ]]; then
  echo $type > $PWD/.node-version;
elif [[ $type =~ ^python ]]; then
  echo $type > $PWD/.python-version;
elif [[ $type =~ ^[j]?ruby ]]; then
  echo $type > $PWD/.ruby-version;
elif [[ $type =~ ^sbt ]]; then
  echo $type > $PWD/.sbt-version;
else
  echo "Invalid environment-type: \"$type\"";
fi

cd .;
