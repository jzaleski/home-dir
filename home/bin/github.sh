#!/usr/bin/env bash

set -e;

open_cmd=`\which open 2> /dev/null`;
if [ -z "$open_cmd" ]; then
  open_cmd=`\which xdg-open 2> /dev/null`;
fi

if [ -z "$open_cmd" ]; then
  echo "Could not locate the \"[xdg-]open\" binary";
  exit 1;
fi

repository=$1;
if [ -n "$repository" ]; then
  cd ${SOURCE_DIRECTORY-$HOME/src}/$repository;
fi

github_url=$GITHUB_URL;

git_cmd=`\which git 2> /dev/null`;
if [ -z "$github_url" ] && [ -n "$git_cmd" ]; then
  if [ -e .git ]; then
    github_url=`$git_cmd config --get remote.origin.url 2> /dev/null`;
  fi
fi

ssh_prefix="git@github.com:";
if [[ "$github_url" =~ "$ssh_prefix" ]]; then
  github_url=`\echo $github_url | \sed "s/$ssh_prefix//"`;
fi

dot_git_suffix=".git";
if [[ "$github_url" =~ "$dot_git_suffix" ]]; then
  github_url=`\echo $github_url | \sed "s/$dot_git_suffix\$//"`;
fi

https_prefix="https://github.com";
if [[ ! "$github_url" =~ "$https_prefix" ]]; then
  github_url="$https_prefix/$github_url";
fi

$open_cmd "$github_url";
