#!/bin/sh
# Ensure mise is installed before other tools that depend on it.

if ! command -v brew >/dev/null 2>&1; then
  echo 'Homebrew is not available; skipping mise installation.'
  exit 0
fi

if ! command -v mise >/dev/null 2>&1; then
  echo 'Installing mise via Homebrew...'
  brew install mise
else
  echo 'mise is already installed.'
fi
