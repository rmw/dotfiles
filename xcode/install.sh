if test ! "$(uname)" = "Darwin"
then
  exit 0
fi

if ! xcode-select -p &>/dev/null
then
  echo 'Installing Xcode Command Line Tools ...'
  xcode-select --install
else
  echo 'Xcode Command Line Tools already installed'
fi
