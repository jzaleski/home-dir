#!/usr/bin/env bash

set -e;

source "$(dirname "$0")"/../.env;

$DOCKER_CMD build \
  --build-arg USER \
  --tag "$IMAGE_NAME":latest \
  "$(dirname "$0")"/..;
