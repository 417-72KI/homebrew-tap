class AssetCatalogConverter < Formula
  desc "Convert R.swift resources with Asset Catalog for Xcode 15"
  homepage "https://github.com/417-72KI/AssetCatalogConverter"
  version "0.1.0"

  deprecate! date: "2023-09-24", because: "renamed to `r2acconverter`"

  on_macos do
    url "https://github.com/417-72KI/AssetCatalogConverter/archive/#{version}.tar.gz"
    sha256 "b4022fd9995d1ff9c427f11a4a4f107563d57198bbc4f528e34964c691cb60ae"
    depends_on :xcode => ["15.0", :build]
  end
  on_linux do
    url "https://github.com/417-72KI/AssetCatalogConverter/releases/download/#{version}/asset-catalog-converter-linux-v#{version}.zip"
    sha256 "1fa1ebbbf7ec60db2ff234c4e09277e62d415e06dfb64984d720763e0182a031"
  end
  license "MIT"
  head "https://github.com/417-72KI/AssetCatalogConverter.git", branch: "main"

  def install
    if OS.mac?
      system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc", "-suppress-warnings"
      bin.install ".build/release/asset-catalog-converter"
    elsif OS.linux?
      bin.install "asset-catalog-converter"
    end
  end

  test do
    system "#{bin}/asset-catalog-converter", "--version"
  end
end
