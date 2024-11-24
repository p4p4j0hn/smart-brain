#!/usr/bin/env bash

set -e

. ./library-scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.5"

$nanolayer_location \
  install \
  devcontainer-feature \
  "ghcr.io/devcontainers-extra/features/npm-package:1.0.3" \
  --option package='@devcontainers/cli' --option version="$VERSION"

echo 'Done!'
