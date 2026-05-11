#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required: https://brew.sh" >&2
  exit 1
fi

brew tap bharath2020/tools

if brew list --formula jaala >/dev/null 2>&1; then
  brew upgrade bharath2020/tools/jaala || true
else
  brew install bharath2020/tools/jaala
fi

if ! command -v mitmdump >/dev/null 2>&1; then
  brew install --cask mitmproxy
fi

if ! command -v axe >/dev/null 2>&1; then
  brew install cameroncooke/axe/axe
fi

echo
jaala --version
mitmdump --version | head -n 1
axe --version
echo
echo "Jaala is installed. Run: jaala --help"
