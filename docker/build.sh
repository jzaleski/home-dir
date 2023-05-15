#!/usr/bin/env bash

set -e;

source "$(dirname "$0")"/../.env;

if [ "$FORCE" = "true" ]; then
  NO_CACHE_FLAG="--no-cache";
fi

$DOCKER_CMD build \
  --build-arg USER \
  --tag "$IMAGE_NAME":latest \
  $NO_CACHE_FLAG \
  --pull \
  "$(dirname "$0")"/..;
