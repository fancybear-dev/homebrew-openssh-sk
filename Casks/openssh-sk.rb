cask "openssh-sk" do
  version "OpenSSH_10.5"
  sha256 "1c7f46cd4a29ad113c7750b27caf6d0a7ecb952b9b973887496df676d857aa2d"

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
