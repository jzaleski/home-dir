#!/usr/bin/env bash

# Prefer google-chrome but fall back to the chromium-browser
chrome_cmd=`\which google-chrome 2> /dev/null`;
if [ -z "$chrome_cmd" ]; then
  chrome_cmd=`\which chromium-browser 2> /dev/null`;
fi

if [ -z "$chrome_cmd" ]; then
  echo "Could not locate an acceptable \"chrome\" binary";
  exit 1;
fi

$chrome_cmd > /dev/null 2>&1
