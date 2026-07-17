cask "openssh-sk" do
  version "OpenSSH_10.4"
  sha256 "88e7f760a8327ccb6a39de9be50b6012fe8fb99de1c9f8b11e8cea523f4e1207"

  url "https://github.com/fancybear-dev/homebrew-openssh-sk/releases/download/#{version}/sk-libfido2.dylib"
  name "OpenSSH SK Middleware"
  desc "Enables FIDO/U2F support for the native macOS OpenSSH client"
  homepage "https://github.com/fancybear-dev/homebrew-openssh-sk"

  livecheck do
    url :stable
    strategy :github_latest
  end

  artifact "sk-libfido2.dylib", target: "/usr/local/lib/sk-libfido2-fancybear-dev.dylib"

  caveats <<~EOS
    To enable the sk-libfido2-fancybear-dev library for SSH, you need to set the SSH_SK_PROVIDER environment variable.

    After installing this Cask, you can add the following line to your shell configuration file (e.g., ~/.zshenv or ~/.bash_profile):
      echo 'export SSH_SK_PROVIDER=/usr/local/lib/sk-libfido2-fancybear-dev.dylib' >> ~/.zshenv
    Before testing it out, either source the file or restart your terminal:
      source ~/.zshenv

    When running for the first time, Apple will refuse to execute it due to security mechanisms. 
    
    To allow the execution, select "Allow anyway" at "Settings" -> "Privacy & Security" -> "Security" (section below). 
    
    If the option is not available, ensure to first set "Allow applications from" to "App Store & Known Developers" at the same section.
  EOS

  uninstall delete: "/usr/local/lib/sk-libfido2-fancybear-dev.dylib"
end
