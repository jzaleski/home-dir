#!/usr/bin/env bash

if [ -z "$USER" ]; then
  echo "Could not determine \"USER\"";
  exit 1;
fi

docker_cmd=`\which docker 2> /dev/null || echo -n`;
if [ -z "$docker_cmd" ]; then
  echo "Could not locate the \"docker\" binary";
  exit 1;
fi

$docker_cmd build \
  --build-arg USER \
  --tag jzaleski/home_dir:latest \
  $(dirname $0)/..;
