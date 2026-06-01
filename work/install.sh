if test ! $(command -v ona)
then
  echo "Installing ona for you."
  curl -o ona -fsSL "https://app.gitpod.io/releases/cli/stable/gitpod-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m | sed 's/x86_64/amd64/;s/\(arm64\|aarch64\)/arm64/')" && \
  chmod +x ona && \
  sudo mv ona /usr/local/bin
fi

