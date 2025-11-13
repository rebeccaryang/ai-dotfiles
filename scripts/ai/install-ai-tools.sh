#!/usr/bin/env bash
# Install AI tooling if missing

set -e

if ! command -v claude >/dev/null 2>&1; then
  brew install claude
fi

if ! command -v gh >/dev/null 2>&1; then
  brew install gh
fi

if ! gh extension list | grep -q "copilot-cli"; then
  gh extension install github/gh-copilot
fi

echo "AI tools installed."
