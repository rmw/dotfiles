if test $(command -v brew); then
  if test ! $(command -v gpg); then
    echo 'Installing gnupg...'
    brew install gnupg
  fi
  if test ! $(command -v mise); then
    echo 'Installing mise...'
    brew install mise
  fi
fi

# Install and globally set latest node using mise
if test $(command -v mise); then
  echo 'Installing and globally setting latest node with mise...'
  mise install node@latest
  mise global node@latest
  echo 'Installing latest yarn with npm...'
  npm install -g yarn
fi

if test ! $(command -v spoof)
then
  if test $(command -v npm)
  then
    echo 'Installing spoof ...'
    sudo npm install spoof -g
  fi
fi
