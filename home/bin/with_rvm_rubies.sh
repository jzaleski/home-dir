#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "Usage: `basename $0` [command]";
  exit 2;
fi

rvm_cmd=`which rvm`;
if [ -z "$rvm_cmd" ]; then
  echo "Could not locate an \"rvm\" executable";
  exit 1;
fi

ruby_versions=`$rvm_cmd list | \grep -oE "(jruby|rbx|ruby)-[^ ]+"`;
if [ -z "$ruby_versions" ]; then
  echo "You must install at least one version of ruby to use this script";
  exit 1;
fi

for ruby_version in $ruby_versions; do
  bash -l -c "\
    rvm $ruby_version@`basename $(pwd)` --create &&
    $@;
  ";
done
