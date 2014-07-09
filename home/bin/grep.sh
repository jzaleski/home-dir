#!/usr/bin/env bash

if hash egrep 2> /dev/null; then
  grep_cmd='egrep --color';
else
  grep_cmd='grep';
fi

$grep_cmd "$@";
