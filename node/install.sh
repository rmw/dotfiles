#!/bin/sh
# Node
# Install and globally set latest node using mise.

if ! command -v brew >/dev/null 2>&1; then
  echo 'Homebrew is not available; skipping node setup.'
  exit 0
fi

if ! command -v mise >/dev/null 2>&1; then
  echo 'Installing mise via Homebrew...'
  brew install mise
fi

if command -v mise >/dev/null 2>&1; then
  echo 'Installing and setting latest node with mise...'
  mise install node@latest
  mise use node@latest
  if command -v npm >/dev/null 2>&1; then
    echo 'Installing latest yarn with npm...'
    npm install -g yarn
  else
    echo 'npm not found after node install; skipping yarn installation.'
  fi
fi

if ! command -v spoof >/dev/null 2>&1; then
  if command -v npm >/dev/null 2>&1; then
    echo 'Installing spoof ...'
    sudo npm install spoof -g
  fi
fi
