cask "openssh-sk" do
  version "OpenSSH_10.0"
  sha256 "4c473187041f81586844723c984ea2f3d2e23bca8b917991c72262a615af6337"

  url "https://github.com/fancybear-dev/homebrew-openssh-sk/releases/download/#{version}/sk-libfido2.dylib"
  name "OpenSSH SK Middleware"
  desc "Enables FIDO/U2F support for the native macOS OpenSSH client"
  homepage "https://github.com/fancybear-dev/homebrew-openssh-sk"

  livecheck do
    url :stable
    strategy :github_latest
  end

  artifact "sk-libfido2.dylib", target: "/usr/local/lib/sk-libfido2-fancybear-dev.dylib"

  uninstall delete: "/usr/local/lib/sk-libfido2-fancybear-dev.dylib"
end
