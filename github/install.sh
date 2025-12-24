#
# GitHub CLI
#
# This installs GitHub CLI (gh) using Homebrew.

if test $(command -v brew); then
  if test ! $(command -v gh)
  then
    echo '  Installing GitHub CLI (gh)...'
    brew install gh
  fi
fi
