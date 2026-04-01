if test $(command -v brew); then
  # desktop
  if test ! $(command -v asdf)
  then
    echo 'Installing asdf ...'
    brew install asdf
    brew install gpg gawk
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  fi
fi
