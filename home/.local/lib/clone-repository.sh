#!/usr/bin/env bash

set -e;

org_name="$1";
repo_name="$2";

if [ -z "$org_name" ] || [ -z "$repo_name" ]; then
  echo "Usage: $(basename "$0") <org-name> <repo-name>";
  exit 1;
fi

git_cmd=$(which git 2> /dev/null || echo -n);
if [ -z "$git_cmd" ]; then
  echo "Could not locate the \"git\" binary";
  exit 1;
fi

base_url=${BASE_URL:-"github.com"};
source_directory=${SOURCE_DIRECTORY:-"${HOME}/src"};
use_https=${USE_HTTPS:-"false"};

if [ "$use_https" = "true" ]; then
  repo_url="https://${base_url}/${org_name}/${repo_name}";
else
  repo_url="git@${base_url}:${org_name}/${repo_name}";
fi

org_dir="${source_directory}/${org_name}";
if [ ! -e "$org_dir" ]; then
  mkdir -p "$org_dir";
fi

$git_cmd clone "$repo_url" "${org_dir}/${repo_name}";
