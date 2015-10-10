#!/usr/bin/env bash

if [ `\git status > /dev/null 2>&1` ]; then
  $HOME/bin/git.sh "$@";
  exit $?;
elif [ `\svn info > /dev/null 2>&1` ]; then
  $HOME/bin/svn.sh "$@";
  exit $?;
else
  echo "WARNING: '`pwd`' is not a working copy";
  exit 1;
fi
