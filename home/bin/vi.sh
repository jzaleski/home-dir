#!/usr/bin/env bash

if \which vim > /dev/null 2>&1; then
  vi_cmd="vim";
else
  vi_cmd="vi";
fi

$vi_cmd "$@";
