class R2ACConverter < Formula
  desc "Convert R.swift resources with Asset Catalog for Xcode 15"
  homepage "https://github.com/417-72KI/R2ACConverter"
  version "0.2.0"

  on_macos do
    url "https://github.com/417-72KI/R2ACConverter/archive/#{version}.tar.gz"
    sha256 "7cd82df862ae1a0ddd8b7372aea0d37dc7c5741323518252faad3b3bc7f74345"
    depends_on :xcode => ["15.0", :build]
  end
  on_linux do
    url "https://github.com/417-72KI/R2ACConverter/releases/download/#{version}/r2acconverter-linux-v#{version}.zip"
    sha256 "c38ca3478ed4016daad43c42d6bdd485a77de4d01f3ab61ac5f673a614440284"
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
