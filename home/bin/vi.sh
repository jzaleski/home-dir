#!/usr/bin/env bash

if hash vim 2> /dev/null; then
  vi_cmd="vim";
else
  vi_cmd="vi";
fi

$vi_cmd "$@";
