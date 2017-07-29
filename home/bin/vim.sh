#!/usr/bin/env bash

if \which nvim > /dev/null 2>&1; then
  vi_cmd="nvim";
else
  vi_cmd="vim";
fi

$vi_cmd "$@";
