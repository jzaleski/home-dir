#!/usr/bin/env bash

set -e;

cat_cmd=$(which cat 2> /dev/null);
if [ -z "$cat_cmd" ]; then
  echo "Could not locate the \"cat\" binary";
  exit 1;
fi

git_cmd=$(which git 2> /dev/null);
if [ -z "$git_cmd" ]; then
  echo "Could not locate the \"git\" binary";
  exit 1;
fi

open_cmd=$(which open 2> /dev/null || echo -n);
if [ -z "$open_cmd" ]; then
  open_cmd=$(which xdg-open 2> /dev/null || echo -n);
fi

if [ -z "$open_cmd" ]; then
  echo "Could not locate the \"[xdg-]open\" binary";
  exit 1;
fi

jenkins_url=$JENKINS_URL;

jenkins_url_file="$HOME/.jenkins-url";
if [ -z "$jenkins_url" ] && [ -e $jenkins_url_file ]; then
  jenkins_url=$($cat_cmd $jenkins_url_file);
fi

if [ -z "$jenkins_url" ]; then
  echo "Could not determine Jenkins URL";
  exit 1;
fi

$open_cmd "$jenkins_url";
