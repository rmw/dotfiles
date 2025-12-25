if test $(command -v brew); then
  if test ! $(command -v libyaml); then
    echo 'Installing libyaml...'
    brew install libyaml
  fi
  if test ! $(command -v mise); then
    echo 'Installing mise...'
    brew install mise
  fi
fi

# Install and globally set latest ruby using mise
if test $(command -v mise); then
  echo 'Installing and globally setting latest ruby with mise...'
  mise install ruby@latest
  mise global ruby@latest
  gem update --system
  sudo gem install rails
fi
