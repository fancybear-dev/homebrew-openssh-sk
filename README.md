# OpenSSH with YubiKey Support

This repository provides a Homebrew formula for installing OpenSSH with YubiKey (FIDO2) support on macOS.

## Installation

1. Add the tap:
   ```bash
   brew tap fancybear-dev/openssh-sk
   ```

2. Install the formula:
   ```bash
   brew install openssh-sk
   ```

## About

This repository is automatically updated with the latest OpenSSH release from the [openssh-portable](https://github.com/openssh/openssh-portable) repository, built with `--with-security-key-builtin` for YubiKey support.
