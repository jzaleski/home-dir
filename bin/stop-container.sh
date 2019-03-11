#!/usr/bin/env bash

docker_cmd=`\which docker 2> /dev/null || echo -n`;
if [ -z "$docker_cmd" ]; then
  echo "Could not locate the \"docker\" binary";
  exit 1;
fi

$docker_cmd stop jzaleski-home_dir > /dev/null;
