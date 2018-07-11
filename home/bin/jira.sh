#!/usr/bin/env bash

open_cmd=`\which open 2> /dev/null`;
if [ -z "$open_cmd" ]; then
  open_cmd=`\which xdg-open 2> /dev/null`;
fi

if [ -z "$open_cmd" ]; then
  echo "Could not locate the \"[xdg-]open\" binary";
  exit 1;
fi

jira_url=$JIRA_URL;
if [ -z "$jira_url" ]; then
  if [ -e .jira-url ]; then
    jira_url=`\cat .jira-url`;
  elif [ -e $HOME/.jira-url ]; then
    jira_url=`\cat $HOME/.jira-url`;
  fi
fi

if [ -z "$jira_url" ]; then
  echo "Could not determine Jira URL";
  exit 1;
fi

argv0=$1;
if [ "$argv0" = "dashboard" ]; then
  jira_url="$jira_url/secure/Dashboard.jspa";
elif [ -n "$argv0" ]; then
  jira_url="$jira_url/browse/$argv0";
else
  jira_url="$jira_url/secure/CreateIssue!default.jspa";
fi

$open_cmd "$jira_url";
