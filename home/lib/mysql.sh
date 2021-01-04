#!/usr/bin/env bash

mysql_cmd=$(which mysql 2> /dev/null || echo -n);
if [ -z "$mysql_cmd" ]; then
  echo "Could not locate \"mysql\" binary";
  exit 1;
fi

sed_cmd=$(which sed 2> /dev/null || echo -n);
if [ -z "$sed_cmd" ]; then
  echo "Could not locate \"sed\" binary";
  exit 1;
fi

if [ -z "$MYCNFFILE" ]; then
  if [ -e "$PWD/.my.cnf" ]; then
    export MYCNFFILE="$PWD/.my.cnf";
  elif [ -e "$HOME/.my.cnf" ]; then
    export MYCNFFILE="$HOME/.my.cnf";
  fi
fi

if [[ "$1" =~ "mysql://" ]]; then
  IFS=":" read -a line_parts <<< $(echo $1 | $sed_cmd 's|mysql://||g; s|[@/]|:|g');
  $mysql_cmd \
    --user="${line_parts[0]}" \
    --password="${line_parts[1]}" \
    --host="${line_parts[2]}" \
    --port=${line_parts[3]} \
    "${line_parts[4]}";
elif [ -n "$MYCNFFILE" ]; then
  eval MYCNFFILE="" $mysql_cmd --defaults-file="$MYCNFFILE";
else
  $mysql_cmd "$@";
fi
