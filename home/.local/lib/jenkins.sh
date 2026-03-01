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

if [ -z "$jenkins_url" ]; then
  if [ -e ".jenkins-url" ]; then
    jenkins_url=$($cat_cmd ".jenkins-url");
  elif [ -e "../.jenkins-url" ]; then
    jenkins_url=$($cat_cmd "../.jenkins-url");
  elif [ -e "$HOME/.jenkins-url" ]; then
    jenkins_url=$($cat_cmd "$HOME/.jenkins-url");
  fi
fi

if [ -z "$jenkins_url" ]; then
  echo "Could not determine Jenkins URL";
  exit 1;
fi

verbose=${VERBOSE:-"false"};
if [ "$verbose" = "true" ]; then
  $open_cmd "$jenkins_url";
else
  $open_cmd "$jenkins_url" > /dev/null 2>&1;
fi
