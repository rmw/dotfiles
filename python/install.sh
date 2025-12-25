# if test $(command -v brew); then
#   if test $(python3 -V | grep -q 'Python 3'); then
#     echo "   installing python"
#     brew install python
#   else
#     echo " upgrading python"
#     brew upgrade python
#   fi

#   # https://installvirtual.com/how-to-install-python-3-8-on-mac-using-pyenv/
#   if test ! $(command -v pyenv); then
#     echo "  installing pyenv"
#     brew install pyenv
#   else
#     echo "  upgrading pyenv"
#     brew upgrade pyenv
#   fi
# fi

if test $(command -v brew); then
  if test $(command -v mise); then
    echo 'Upgrading mise...'
    brew upgrade mise
  else
    echo 'Installing mise...'
    brew install mise
  fi
fi

# Install and globally set latest python using mise
if test $(command -v mise); then
  echo 'Installing and globally setting latest python with mise...'
  mise install python@latest
  mise global python@latest
  # Ensure pip is installed
  if ! command -v pip3 >/dev/null 2>&1; then
    echo 'Installing pip for python...'
    python3 -m ensurepip --upgrade || curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && rm get-pip.py
  fi
  # Always upgrade pip to latest
  python3 -m pip install --upgrade pip
fi