#!/usr/bin/env bash

svn_cmd=`\which svn 2> /dev/null`;
if [ -z "$svn_cmd" ]; then
  echo "Could not locate the \"svn\" binary";
  exit 1;
fi

git_cmd=`\which git 2> /dev/null`;
if [ -n "$git_cmd" ] && [ ! -d ".svn" ] && [ -d ".git" ]; then
  $git_cmd "$@";
  exit $?;
fi

$svn_cmd "$@";
