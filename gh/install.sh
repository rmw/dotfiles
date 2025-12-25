#!/bin/sh
# Install GitHub CLI
if test $(command -v brew); then
  if test ! $(command -v gh); then
    echo 'Installing GitHub CLI...'
    brew install gh
  else
    echo 'Upgrading GitHub CLI...'
    brew upgrade gh
  fi
fi
