# export PATH="$HOME/.poetry/bin:$PATH"

# Add user base bin for latest Python to PATH
user_base_bin="$(python3 -m site --user-base 2>/dev/null)/bin"
if [ ! -d "$user_base_bin" ]; then
  mkdir -p "$user_base_bin"
fi
export PATH="$user_base_bin:$PATH"