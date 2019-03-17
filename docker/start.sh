#!/usr/bin/env bash

set -e;

source "$(dirname "$0")"/../.env;

volume_arg="";
if [ -n "$SOURCE_DIRECTORY" ] && [ -e "$SOURCE_DIRECTORY" ]; then
  volume_arg="--volume $SOURCE_DIRECTORY:/home/$USER/src";
fi

$DOCKER_CMD run \
  --detach \
  --name "$CONTAINER_NAME" \
  --rm \
  --tty \
  $volume_arg \
  "$IMAGE_NAME":latest;
