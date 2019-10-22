#!/usr/bin/env bash

set -e;

source "$(dirname "$0")"/../.env;

$DOCKER_CMD exec \
  --interactive \
  --tty \
  "$CONTAINER_NAME" \
  ${SHELL:-"bash"};
