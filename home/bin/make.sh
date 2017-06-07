#!/usr/bin/env bash

# GNU make support
if [ -f "Makefile" ] && hash make 2> /dev/null; then
  make_cmd="make";
# Adhoc Python test support
elif [ -f "test.py" ]; then
  make_cmd="python test.py";
# Python/PyTest support
elif [ -f "setup.py" ]; then
  make_cmd="python setup.py test";
# Apache Maven support
elif [ -f "pom.xml" ] && hash mvn 2> /dev/null; then
  make_cmd="mvn";
  [[ -z "$1" ]] && make_cmd="mvn compile";
# Adhoc Ruby test support
elif [ -f "test.rb" ]; then
  make_cmd="bundle exec ruby test.rb";
# Rake support
elif [ -f "Rakefile" ] && hash rake 2> /dev/null; then
  make_cmd="rake";
# run_tests.sh support
elif [ -f "bin/run_tests.sh" ]; then
  make_cmd="bin/run_tests.sh";
fi

# Give up if we could not find a valid compiler
if [ -z "$make_cmd" ]; then
  echo "Could not locate a valid compiler";
  exit 1;
fi

# Run the selected make-command with the specified argument(s)
$make_cmd "$@";
