#!/usr/bin/env bash

# Run renovate with github token
GH_APP_AUTH_TOKEN=ghs_123<REDACTED>

podman run \
  --name renovate-manual-1 --rm \
  -v "$(pwd):/usr/src/app/local-repo" \
  -e RENOVATE_PLATFORM="local" \
  -e RENOVATE_ONBOARDING="false" \
  -e RENOVATE_CONFIG_FILE="/usr/src/app/local-repo/renovate.json" \
  -e RENOVATE_GITHUB_COM_TOKEN=${GH_APP_AUTH_TOKEN} \
  -e LOG_LEVEL="debug" \
  renovate/renovate:43.76.2 > renovate-local-with-gh-token.log
  