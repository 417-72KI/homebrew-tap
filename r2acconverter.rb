class R2acconverter < Formula
  desc "Convert R.swift resources with Asset Catalog for Xcode 15"
  homepage "https://github.com/417-72KI/R2ACConverter"
  version "0.3.1"

  on_macos do
    url "https://github.com/417-72KI/R2ACConverter/archive/#{version}.tar.gz"
    sha256 "ab8dd92ac15afe8a3c5a6248727d73cb44db69b1a8be7aafa824415c8bedf9c3"
    depends_on :xcode => ["15.0", :build]
  end
  on_linux do
    url "https://github.com/417-72KI/R2ACConverter/releases/download/#{version}/r2acconverter-linux-v#{version}.zip"
    sha256 "aaab64624f1f393f9b0409225fe7cef9032723c1820a14706ac700d2a476fe0b"
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
