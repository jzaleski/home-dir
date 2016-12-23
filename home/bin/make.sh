#!/usr/bin/env bash

# GNU make support
if [ -f "Makefile" ] && hash make 2> /dev/null; then
  make_cmd="make";
# Apache Maven support
elif [ -f "pom.xml" ] && hash mvn 2> /dev/null; then
  make_cmd="mvn";
  [[ -z "$1" ]] && make_cmd="mvn compile";
# Rake support
elif [ -f "Rakefile" ] && hash rake 2> /dev/null; then
  make_cmd="rake";
fi

# Give up if we could not find a valid compiler
if [ -z "$make_cmd" ]; then
  echo "Could not locate a valid compiler";
  exit 1;
fi

# Run the selected make-command with the specified argument(s)
$make_cmd "$@";
