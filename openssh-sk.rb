class OpensshSk < Formula
  desc "OpenSSH with security key support for YubiKeys"
  homepage "https://www.openssh.com/"
  url "https://github.com/openssh/openssh-portable/archive/V_10_0_P2.tar.gz"
  version "10_0_P2"
  sha256 "a25b32645dc6b474064b9deb07afc9d8e37b127d026a1170b54feb929145140c"

  depends_on "libfido2"
  depends_on "openssl"
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "autoreconf"
    system "./configure", "--with-security-key-builtin",
      "--with-libfido2=#{Formula['libfido2'].opt_prefix}",
      "--with-ssl-dir=#{Formula['openssl@1.1'].opt_prefix}",
      "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    lib.install "sk-libfido2.dylib"
  end

  def caveats
    <<~EOS
      The sk-libfido2.dylib library is installed to #{HOMEBREW_PREFIX}/lib.
      To use with SSH, add to your ~/.zshenv:
        export SSH_SK_PROVIDER=#{HOMEBREW_PREFIX}/lib/sk-libfido2.dylib
      Or, use: ssh -O SecurityKeyProvider=$SSH_SK_PROVIDER user@host
    EOS
  end
end
