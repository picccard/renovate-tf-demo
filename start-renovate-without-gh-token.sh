#!/usr/bin/env bash

# Run renovate without github token
podman run \
  --name renovate-manual-1 --rm \
  -v "$(pwd):/usr/src/app/local-repo" \
  -e RENOVATE_PLATFORM="local" \
  -e RENOVATE_ONBOARDING="false" \
  -e RENOVATE_CONFIG_FILE="/usr/src/app/local-repo/renovate.json" \
  -e LOG_LEVEL="debug" \
  renovate/renovate:43.76.2 > renovate-local-without-gh-token.log
