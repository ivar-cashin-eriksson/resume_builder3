#!/usr/bin/env bash
set -euo pipefail

if ! id guest >/dev/null 2>&1; then
  sudo adduser --system --home /home/guest --shell /bin/bash --group guest
fi

sudo usermod -a -G guest runner
sudo usermod -a -G runner guest

sudo chown -R runner:guest "$GITHUB_WORKSPACE"
sudo chmod -R g+rwX "$GITHUB_WORKSPACE"
sudo find "$GITHUB_WORKSPACE" -type d -exec chmod g+s {} +

sudo mkdir -p /home/guest/.codex
sudo chown -R guest:guest /home/guest
