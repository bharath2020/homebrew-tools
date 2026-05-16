#!/usr/bin/env bash
set -euo pipefail

if command -v brew >/dev/null 2>&1; then
  BREW_CMD="$(command -v brew)"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  BREW_CMD="/opt/homebrew/bin/brew"
elif [[ -x /usr/local/bin/brew ]]; then
  BREW_CMD="/usr/local/bin/brew"
else
  echo "Homebrew is required: https://brew.sh" >&2
  exit 1
fi

BREW_PREFIX="$("$BREW_CMD" --prefix)"
BREW_BIN="$BREW_PREFIX/bin"

if [[ ":$PATH:" != *":$BREW_BIN:"* ]]; then
  export PATH="$BREW_BIN:$PATH"

  if [[ -n "${HOME:-}" ]]; then
    SHELL_PROFILE="$HOME/.zprofile"
    SHELLENV_LINE="eval \"\$($BREW_BIN/brew shellenv)\""

    case "${SHELL:-}" in
      */bash) SHELL_PROFILE="$HOME/.bash_profile" ;;
      */zsh|"") SHELL_PROFILE="$HOME/.zprofile" ;;
    esac

    touch "$SHELL_PROFILE"
    if ! grep -Fqx "$SHELLENV_LINE" "$SHELL_PROFILE"; then
      printf '\n%s\n' "$SHELLENV_LINE" >> "$SHELL_PROFILE"
      echo "Added Homebrew to PATH in $SHELL_PROFILE"
    fi
  fi
fi

brew tap bharath2020/tools

if [[ ! -x "$BREW_BIN/mitmdump" ]]; then
  echo "Installing mitmproxy for mitmdump..."
  brew install --cask mitmproxy
fi

if [[ ! -x "$BREW_BIN/axe" ]]; then
  echo "Installing AXe for validation scripts..."
  brew install cameroncooke/axe/axe
fi

if brew list --formula jaala >/dev/null 2>&1; then
  brew upgrade bharath2020/tools/jaala || true
else
  brew install bharath2020/tools/jaala
fi

if [[ ! -x "$BREW_BIN/jaala" ]]; then
  brew link --overwrite jaala
fi

echo
"$BREW_BIN/jaala" --version
"$BREW_BIN/mitmdump" --version | head -n 1
"$BREW_BIN/axe" --version
echo
echo "Jaala is installed. Run: jaala --help"
