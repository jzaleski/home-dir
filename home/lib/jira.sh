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

jira_url=$JIRA_URL;

if [ -z "$jira_url" ]; then
  if [ -e ".jira-url" ]; then
    jira_url=$($cat_cmd ".jira-url");
  elif [ -e "../.jira-url" ]; then
    jira_url=$($cat_cmd "../.jira-url");
  elif [ -e "$HOME/.jira-url" ]; then
    jira_url=$($cat_cmd "$HOME/.jira-url");
  fi
fi

if [ -z "$jira_url" ]; then
  echo "Could not determine Jira URL";
  exit 1;
fi

action_or_issue_id=$1;

git_branch=$($git_cmd rev-parse --abbrev-ref HEAD 2> /dev/null || echo -n);
if \
  [ -z "$action_or_issue_id" ] && \
  [ -n "$git_branch" ] && \
  [[ "$git_branch" =~ ^[A-Z0-9]+-[0-9]+$ ]];
then
  action_or_issue_id=$git_branch;
fi

if [ -z "$action_or_issue_id" ]; then
  action_or_issue_id=create;
fi

if [ "$action_or_issue_id" = "create" ]; then
  jira_url="$jira_url/secure/CreateIssue!default.jspa";
elif [ "$action_or_issue_id" = "dashboard" ]; then
  jira_url="$jira_url/secure/Dashboard.jspa";
elif [[ "$action_or_issue_id" =~ ^[A-Z0-9]+-[0-9]+$ ]]; then
  jira_url="$jira_url/browse/$action_or_issue_id";
else
  echo "Could not determine action";
  exit 1;
fi

verbose=${VERBOSE:-"false"};
if [ "$verbose" = "true" ]; then
  $open_cmd "$jira_url";
else
  $open_cmd "$jira_url" > /dev/null 2>&1;
fi
