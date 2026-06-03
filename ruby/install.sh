# Install and set latest ruby using mise
if test $(command -v mise); then
  echo 'Installing and setting latest ruby with mise...'
  mise install ruby@latest
  mise use ruby@latest
  gem update --system
  sudo gem install rails
fi
