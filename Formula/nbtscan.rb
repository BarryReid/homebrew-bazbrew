class Nbtscan < Formula
  desc "NetBIOS Scanner"
  homepage "http://www.inetcat.org/software/nbtscan.html"
  url "https://ftp.openbsd.org/pub/OpenBSD/distfiles/nbtscan_1.5.1.tar.gz"
  sha256 "1437da6af9b598d91fe939cb963cd3c8d2e043455b73fb4c46352ab0d2e2127c"

  patch :p1 do
    url "https://gist.githubusercontent.com/BarryReid/7c1f1145746e2096489bca468316c93a/raw/430080d332a1ffdc91905b80d2c0331c0c6bb071/debian-patches-04_fix_compiler_warnings.diff"
    sha256 "04c364f29a1b6a9bdfa87644583a6c6ca77b5da6ad6620548e246d763c5bfd17"
  end

  patch :p1 do
    url "https://gist.githubusercontent.com/BarryReid/692cc8cd2c68c575b692fddaea2fcd57/raw/3955103e38cd9f1a0df464d5f3acb8bd3bcb8cec/debian-patches-05_fix_off_by_one.diff"
    sha256 "391b4f46cbbc397eac5cb7bf40a99674c8998d870a58d58dcf31aa352d2bf95c"
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    bin.install "nbtscan"
  end

  test do
    system bin/"nbtscan", "127.0.0.1"
  end
end
