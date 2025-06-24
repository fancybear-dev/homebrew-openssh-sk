# OpenSSH SK Middleware for macOS

WARNING: this is a fun PoC, but best to do `brew install openssh` as they support security keys as configured in the Cask here; https://github.com/Homebrew/homebrew-core/blob/4caae34f18f7dc5a0903ebe92275ae9397010aa1/Formula/o/openssh.rb#L89

This repository provides a pre-compiled `sk-libfido2.dylib` for macOS, enabling hardware security key (FIDO/U2F, e.g., YubiKey) support for the native OpenSSH client that comes with macOS.

This is built from the official [OpenSSH portable source code](https://github.com/openssh/openssh-portable). The GitHub Action in this repository automatically checks for new OpenSSH versions daily, builds the `dylib`, and creates a new release and Homebrew Cask.

Please fork this repo if you want to use it, as the supply chain risk is highly sensitive. 

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

This command will download the correct `sk-libfido2.dylib` from the [releases page](https://github.com/fancybear-dev/homebrew-openssh-sk/releases) and place it at `/usr/local/lib/sk-libfido2-fancybear-dev.dylib`.

When running for the first time, Apple will refuse to execute it due to security mechanisms. To allow the execution, select "Allow anyway" at "Settings" -> "Privacy & Security" -> "Security" (section below). If the option is not available, ensure to first set "Allow applications from" to "App Store & Known Developers" at the same section.

## Uninstallation

To uninstall, you can use Homebrew:

```sh
brew uninstall --cask openssh-sk
```

This will remove the `/usr/local/lib/sk-libfido2-fancybear-dev.dylib` file.
