#!/usr/bin/env bash

open_cmd=`\which open 2> /dev/null`;
if [ -z "$open_cmd" ]; then
  echo "Could not locate the \"open\" binary";
  exit 1;
fi

github_url=${GITHUB_URL-https://www.github.com};

argv0=$1;
if [ -n "$argv0" ]; then
  github_url="$github_url/$argv0";
fi

argv1=$2;
if [[ "$argv1" =~ ^[0-9]+$ ]]; then
  github_url="$github_url/pull/$argv1";
elif [ -n "$argv1" ]; then
  github_url="$github_url/tree/$argv1";
fi

$open_cmd "$github_url";
