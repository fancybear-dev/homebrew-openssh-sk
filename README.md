# OpenSSH SK Middleware for macOS

This repository provides a pre-compiled `sk-libfido2.dylib` for macOS, enabling hardware security key (FIDO/U2F, e.g., YubiKey) support for the native OpenSSH client that comes with macOS.

This is built from the official [OpenSSH portable source code](https://github.com/openssh/openssh-portable). The GitHub Action in this repository automatically checks for new OpenSSH versions daily, builds the `dylib`, and creates a new release and Homebrew Cask.

## Requirements

- macOS Sonoma (14.0) or later.
- [Homebrew](https://brew.sh/) installed.

## Installation

You can install this middleware using Homebrew.

First, tap this repository:
```sh
brew tap fancybear-dev/openssh-sk
```

Then, install the cask:
```sh
brew install --cask openssh-sk
```

This command will download the correct `sk-libfido2.dylib` from the [releases page](https://github.com/fancybear-dev/homebrew-openssh-sk/releases) and place it at `/usr/local/lib/sk-libfido2.dylib`. The native OpenSSH client on macOS will automatically use this library when you use a security key for authentication.

## Uninstallation

To uninstall, you can use Homebrew:

```sh
brew uninstall --cask openssh-sk
```

This will remove the `/usr/local/lib/sk-libfido2.dylib` file.