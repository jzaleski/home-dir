#!/usr/bin/env bash

set -e;

cat_cmd=$(which cat 2> /dev/null || echo -n);
if [ -z "$cat_cmd" ]; then
  echo "Could not locate the \"cat\" binary";
  exit 1;
fi

git_cmd=$(which git 2> /dev/null || echo -n);
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

sed_cmd=$(which sed 2> /dev/null || echo -n);
if [ -z "$sed_cmd" ]; then
  echo "Could not locate the \"sed\" binary";
  exit 1;
fi

source_dir=${SOURCE_DIRECTORY:-"$HOME/src"};

repository_arg=$1;
if [ -n "$repository_arg" ] && [ "$repository_arg" != "repo" ]; then
  cd "$source_dir/$repository_arg";
fi

branch_arg=$2;
if [ -n "$branch_arg" ]; then
  branch=$branch_arg;
else
  branch=$($git_cmd rev-parse --abbrev-ref HEAD 2> /dev/null || echo -n);
fi

bitbucket_url=$BITBUCKET_URL;

if [ -z "$bitbucket_url" ]; then
  if [ -e ".bitbucket-url" ]; then
    bitbucket_url=$($cat_cmd ".bitbucket-url");
  elif [ -e "../.bitbucket-url" ]; then
    bitbucket_url=$($cat_cmd "../.bitbucket-url");
  fi
fi

if [ -z "$bitbucket_url" ]; then
  echo "Could not determine \"bitbucket-url\"";
  exit 1;
fi

verbose=${VERBOSE:-"false"};
if [ "$verbose" = "true" ]; then
  $open_cmd "$bitbucket_url";
else
  $open_cmd "$bitbucket_url" > /dev/null 2>&1;
fi
