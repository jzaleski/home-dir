#!/bin/bash

git_root=`git rev-parse --show-toplevel 2> /dev/null`;

[[ -n "$git_root" ]] && cd $git_root;
