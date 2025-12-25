# https://opensource.com/article/19/5/python-3-default-mac
# alias python='python3'
# alias pip='pip3'
# alias poetry="python3 $HOME/.poetry/bin/poetry"

# Ensure python and pip point to python3 and pip3
if command -v python3 >/dev/null 2>&1; then
  alias python=python3
fi
if command -v pip3 >/dev/null 2>&1; then
  alias pip=pip3
fi
