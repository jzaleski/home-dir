#!/usr/bin/env bash

docker_cmd=`\which docker 2> /dev/null || echo -n`;
if [ -z "$docker_cmd" ]; then
  echo "Could not locate the \"docker\" binary";
  exit 1;
fi

container_name="jzaleski-home_dir";

if ! $docker_cmd start $container_name > /dev/null 2>&1; then
  $docker_cmd run \
    --detach \
    --name $container_name \
    --tty \
    jzaleski/home_dir:latest > /dev/null;
fi
