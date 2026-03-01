#!/usr/bin/env bash

set -e;

cat_cmd=$(which cat 2> /dev/null);
if [ -z "$cat_cmd" ]; then
  echo "Could not locate the \"cat\" binary";
  exit 1;
fi

git_cmd=$(which git 2> /dev/null);
if [ -z "$git_cmd" ]; then
  echo "Could not locate the \"git\" binary";
  exit 1;
fi

open_cmd=$(which open 2> /dev/null || echo -n);
if [ -z "$open_cmd" ]; then
  open_cmd=$(which xdg-open 2> /dev/null || echo -n);
fi

if [ -z "$open_cmd" ]; then
  echo "Could not locate the \"[xdg-]open\" binary";
  exit 1;
fi

confluence_url=$CONFLUENCE_URL;

if [ -z "$confluence_url" ]; then
  if [ -e ".confluence-url" ]; then
    confluence_url=$($cat_cmd ".confluence-url");
  elif [ -e "../.confluence-url" ]; then
    confluence_url=$($cat_cmd "../.confluence-url");
  elif [ -e "$HOME/.confluence-url" ]; then
    confluence_url=$($cat_cmd "$HOME/.confluence-url");
  fi
fi

if [ -z "$confluence_url" ]; then
  echo "Could not determine Confluence URL";
  exit 1;
fi

space_id=$1;
if [ -n "$space_id" ]; then
  confluence_url="$confluence_url/spaces/$space_id/overview";
fi

verbose=${VERBOSE:-"false"};
if [ "$verbose" = "true" ]; then
  $open_cmd "$confluence_url";
else
  $open_cmd "$confluence_url" > /dev/null 2>&1;
fi
