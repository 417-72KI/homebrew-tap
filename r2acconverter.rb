class R2acconverter < Formula
  desc "Convert R.swift resources with Asset Catalog for Xcode 15"
  homepage "https://github.com/417-72KI/R2ACConverter"
  version "0.3.0"

  on_macos do
    url "https://github.com/417-72KI/R2ACConverter/archive/#{version}.tar.gz"
    sha256 "ca43047cce4de946c5455ee79d6059374265988822932d433fb95104cde08fa4"
    depends_on :xcode => ["15.0", :build]
  end
  on_linux do
    url "https://github.com/417-72KI/R2ACConverter/releases/download/#{version}/r2acconverter-linux-v#{version}.zip"
    sha256 "58cb04a4374f052f8f892499ad97dd265745971b27150008b4e70bc686c97ee0"
  end
  license "MIT"
  head "https://github.com/417-72KI/R2ACConverter.git", branch: "main"

  def install
    if OS.mac?
      system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc", "-suppress-warnings"
      bin.install ".build/release/r2acconverter"
    elsif OS.linux?
      bin.install "r2acconverter"
    end
  end

  test do
    system "#{bin}/r2acconverter", "--version"
  end
end
