#!/usr/bin/env bash

set -e;

source "$(dirname "$0")"/../.env;

$DOCKER_CMD rmi "$CONTAINER_NAME";
