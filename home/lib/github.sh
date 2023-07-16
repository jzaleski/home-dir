#!/usr/bin/env bash

set -e;

cat_cmd=$(which cat 2> /dev/null || echo -n);
if [ -z "$cat_cmd" ]; then
  echo "Could not locate the \"cat\" binary";
  exit 1;
fi

git_cmd=$(which git 2> /dev/null || echo -n);
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

sed_cmd=$(which sed 2> /dev/null || echo -n);
if [ -z "$sed_cmd" ]; then
  echo "Could not locate the \"sed\" binary";
  exit 1;
fi

source_dir=${SOURCE_DIRECTORY:-"$HOME/src"};

repository_arg=$1;
if [ -n "$repository_arg" ] && [ "$repository_arg" != "repo" ]; then
  cd "$source_dir/$repository_arg";
fi

branch_arg=$2;
if [ -n "$branch_arg" ]; then
  branch=$branch_arg;
else
  branch=$($git_cmd rev-parse --abbrev-ref HEAD 2> /dev/null || echo -n);
fi

github_url_file="$HOME/.github-url";
repository_root=$($git_cmd rev-parse --show-toplevel 2> /dev/null || echo -n);

github_url=${GITHUB_URL:-""}
if [ -z "$github_url" ]; then
  if [ -n "$repository_root" ]; then
    github_url=$($git_cmd config --get remote.origin.url 2> /dev/null);
  elif [ -e "$github_url_file" ]; then
    github_url=$($cat_cmd "$github_url_file");
  else
    github_url="https://github.com";
  fi
fi

ssh_prefix="git@github.com:";
if [[ "$github_url" =~ $ssh_prefix ]]; then
  github_url=$(echo "$github_url" | $sed_cmd "s/$ssh_prefix//");
fi

dot_git_suffix=".git";
if [[ "$github_url" =~ $dot_git_suffix ]]; then
  github_url=$(echo "$github_url" | $sed_cmd "s/$dot_git_suffix\$//");
fi

https_prefix="https://github.com";
if [[ ! "$github_url" =~ $https_prefix ]]; then
  github_url="$https_prefix/$github_url";
fi

if [ -n "$branch" ] && [ "$repository_arg" != "repo" ]; then
  github_url="$github_url/tree/$branch";
fi

$open_cmd "$github_url";
