#!/usr/bin/env bash

set -e;

ab_cmd=`\which ab 2> /dev/null`;
if [ -z "$ab_cmd" ]; then
  echo "Could not locate the \"ab\" binary";
  exit 1;
fi

config_file=${AB_CONFIG_FILE-.abrc};
if [ -f $config_file ] || [ -h $config_file ]; then
  source $config_file;
fi

concurrency="$AB_CONCURRENCY";
if [ -n "$concurrency" ]; then
  ab_cmd="$ab_cmd -c $concurrency";
fi

requests="$AB_REQUESTS";
if [ -n "$requests" ]; then
  ab_cmd="$ab_cmd -n $requests";
fi

headers="$AB_HEADERS";
if [ -n "$headers" ]; then
  ab_cmd="$ab_cmd -H \"$headers\"";
fi

post_file="$AB_POST_FILE";
if [ -n "$post_file" ]; then
  ab_cmd="$ab_cmd -p \"$post_file\"";
fi

protocol="${AB_PROTOCOL-http}";
hostname="$AB_HOSTNAME";
port="$AB_PORT";
path="${AB_PATH-/}";

if [ -n "$hostname" ] && [ -n "$port" ]; then
  ab_cmd="$ab_cmd \"$protocol://$hostname:$port$path\"";
fi

echo $ab_cmd "$@" | sh
