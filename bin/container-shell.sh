#!/usr/bin/env bash

docker_cmd=`\which docker 2> /dev/null || echo -n`;
if [ -z "$docker_cmd" ]; then
  echo "Could not locate the \"docker\" binary";
  exit 1;
fi

container_name="jzaleski-home_dir";

if [ -n `$docker_cmd ps -q --filter "name=$container_name"` ]; then
  $docker_cmd exec \
    --interactive \
    --tty \
    $container_name \
    /bin/bash;
fi
