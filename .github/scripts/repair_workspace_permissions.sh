#!/usr/bin/env bash
set -euo pipefail

sudo chown -R runner:guest "$GITHUB_WORKSPACE"
sudo chmod -R g+rwX "$GITHUB_WORKSPACE"
sudo find "$GITHUB_WORKSPACE" -type d -exec chmod g+s {} +
