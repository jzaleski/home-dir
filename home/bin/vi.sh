#!/usr/bin/env bash

if \which nvim > /dev/null 2>&1; then
  vi_cmd="nvim";
elif \which vim > /dev/null 2>&1; then
  vi_cmd="vim";
else
  vi_cmd="vi";
fi

$vi_cmd "$@";
