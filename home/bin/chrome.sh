#!/usr/bin/env bash

# Prefer google-chrome but fall back to the chromium-browser
if hash google-chrome 2> /dev/null; then
  chrome_cmd="google-chrome";
elif hash chromium-browser 2> /dev/null; then
  chrome_cmd="chromium-browser";
fi

if [ -z "$chrome_cmd" ]; then
  echo "Could not locate an acceptable \"chrome\" binary";
  exit 1;
fi

$chrome_cmd > /dev/null 2>&1
