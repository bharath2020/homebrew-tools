# homebrew-tools

Homebrew tap for Bharath's utilities.

## Install

Jaala:

```bash
curl -fsSL https://raw.githubusercontent.com/bharath2020/homebrew-tools/main/install-jaala.sh | bash
```

Or install manually:

```bash
brew tap bharath2020/tools
brew install bharath2020/tools/jaala
brew install --cask mitmproxy
brew install cameroncooke/axe/axe
```

adf-auth (macOS 14+, builds from source with Xcode):

```bash
brew tap bharath2020/tools
brew trust --formula bharath2020/tools/adf-auth
brew install bharath2020/tools/adf-auth
```

Other tools:

```bash
brew install simproxy-beta
```
