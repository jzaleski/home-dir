#!/usr/bin/env bash

git_cmd=`\which git 2> /dev/null`;
if [ -z "$git_cmd" ]; then
  echo "Could not locate the \"git\" binary";
  exit 1;
fi

svn_cmd=`\which svn 2> /dev/null`;
if [ -n "$svn_cmd" ] && [ ! -d ".git" ] && [ -d ".svn" ]; then
  $svn_cmd "$@";
  exit $?;
fi

$git_cmd "$@";
