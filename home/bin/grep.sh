#!/usr/bin/env bash

if \which ag > /dev/null 2>&1; then
  grep_cmd="ag";
elif \which egrep > /dev/null 2>&1; then
  grep_cmd="egrep --color";
else
  grep_cmd="grep";
fi

$grep_cmd "$@";
