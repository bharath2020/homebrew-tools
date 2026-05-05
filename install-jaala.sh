#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required: https://brew.sh" >&2
  exit 1
fi

brew tap bharath2020/tools

if brew list --formula jaala >/dev/null 2>&1; then
  brew upgrade jaala || true
else
  brew install jaala
fi

if ! command -v mitmdump >/dev/null 2>&1; then
  brew install --cask mitmproxy
fi

echo
jaala --version
mitmdump --version | head -n 1
echo
echo "Jaala is installed. Run: jaala --help"
