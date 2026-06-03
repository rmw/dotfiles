if [ "$(uname)" != "Darwin" ]; then
  exit 0
fi

RUN_MACOS_UPDATE=false
for arg in "$@"; do
  case "$arg" in
    --macos-update)
      RUN_MACOS_UPDATE=true
      ;;
  esac
done

# This script is macOS-only. It should not run on Linux/ona environments.
# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store.

if [ "$RUN_MACOS_UPDATE" = true ]; then
  echo "› sudo softwareupdate -i -a"
  sudo softwareupdate -i -a
fi
