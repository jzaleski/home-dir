#!/usr/bin/env bash

if [ -d ".git" ]; then
  $HOME/bin/git.sh "$@";
  exit $?;
elif [ -d ".svn" ]; then
  $HOME/bin/svn.sh "$@";
  exit $?;
else
  echo "WARNING: '`pwd`' is not a working copy";
  exit 1;
fi
