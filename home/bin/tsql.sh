#!/usr/bin/env bash

tsql_cmd=`\which tsql 2> /dev/null`
if [ -z "$tsql_cmd" ]; then
  echo "Could not locate the \"tsql\" binary";
  exit 1;
fi

config_file="$TSQL_CONFIG_FILE";
if [ -f $config_file ]; then
  source $config_file;
fi

hostname="$TSQL_HOSTNAME";
if [ -n "$hostname" ]; then
  tsql_cmd="$tsql_cmd -H $hostname";
fi

port="$TSQL_PORT";
if [ -n "$port" ]; then
  tsql_cmd="$tsql_cmd -p $port";
fi

database="$TSQL_DATABASE";
if [ -n "$database" ]; then
  tsql_cmd="$tsql_cmd -D $database";
fi

username="$TSQL_USERNAME";
if [ -n "$username" ]; then
  tsql_cmd="$tsql_cmd -U $username";
fi

password="$TSQL_PASSWORD";
if [ -n "$password" ]; then
  tsql_cmd="$tsql_cmd -P $password";
fi

$tsql_cmd "$@";
