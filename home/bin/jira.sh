#!/usr/bin/env bash

open_cmd=`\which open 2> /dev/null`;
if [ -z "$open_cmd" ]; then
  echo "Could not locate the \"open\" binary";
  exit 1;
fi

jira_url=$JIRA_URL;
jira_url_file=$HOME/.jira-url;

if [ -z "$jira_url" ] && [ -e $jira_url_file ]; then
  jira_url=`\cat $jira_url_file`;
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
