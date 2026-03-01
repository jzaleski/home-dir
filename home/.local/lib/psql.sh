#!/usr/bin/env bash

psql_cmd=$(which psql 2> /dev/null || echo -n);
if [ -z "$psql_cmd" ]; then
  echo "Could not locate \"psql\" binary";
  exit 1;
fi

if [ -z "$PGPASSFILE" ]; then
  if [ -e "$PWD/.pgpass" ]; then
    export PGPASSFILE=$PWD/.pgpass;
  elif [ -e "$HOME/.pgpass" ]; then
    export PGPASSFILE=$HOME/.pgpass;
  fi
fi

psql_env_vars="";
if [ -n "$PGPASSFILE" ]; then
  IFS=":"; line_parts=($(head -1 $PGPASSFILE)); unset IFS;
  psql_env_vars="PGPASS_FILE=\"\" PGHOST=\"${line_parts[0]}\" PGPORT=${line_parts[1]} PGDATABASE=\"${line_parts[2]}\" PGUSER=\"${line_parts[3]}\" PGPASSWORD=\"${line_parts[4]}\"";
fi

if [ -n "$psql_env_vars" ]; then
  eval $psql_env_vars $psql_cmd "$@";
else
  $psql_cmd "$@";
fi
