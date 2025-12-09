if test $(command -v brew); then
  if test $(command -v mise); then
    echo 'Upgrading mise...'
    brew upgrade mise
  else
    echo 'Installing mise...'
    brew install mise
  fi
fi
