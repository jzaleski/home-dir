#!/usr/bin/env bash

mysql_cmd=`\which mysql 2> /dev/null`;
if [ -z "$mysql_cmd" ]; then
  echo "Could not locate \"mysql\" binary";
  exit 1;
fi

if [ -z "$MYCNFFILE" ]; then
  if [ -e "$PWD/.my.cnf" ]; then
    export MYCNFFILE="$PWD/.my.cnf";
  elif [ -e "$HOME/.my.cnf" ]; then
    export MYCNFFILE="$HOME/.my.cnf";
  fi
fi

if [ -n "$MYCNFFILE" ]; then
  eval MYCNFFILE="" $mysql_cmd --defaults-file=$MYCNFFILE "$@";
else
  $mysql_cmd "$@";
fi
