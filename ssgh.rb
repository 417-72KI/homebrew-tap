class Ssgh < Formula
  desc "Deliver stars on your behalf"
  homepage "https://github.com/417-72KI/SSGH"
  version "1.2.0"

  on_macos do
    url "https://github.com/417-72KI/SSGH/archive/#{version}.tar.gz"
    sha256 "d6cd10befe3e91425df8e0cd4c964e3b3340b9f0253538811cdb1859277ac1a9"
    depends_on :xcode => ["13.3", :build]
  end
  on_linux do
    url "https://github.com/417-72KI/SSGH/releases/download/#{version}/ssgh-linux-v#{version}.zip"
    sha256 "31ad5075346f9270fca4e01dbaabad5e61caa6213a9bcbf5885832a863f3d916"
  end
  license "MIT"
  head "https://github.com/417-72KI/SSGH.git", branch: "main"

  def install
    if OS.mac?
      system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc", "-suppress-warnings"
      bin.install ".build/release/ssgh"
    elsif OS.linux?
      bin.install "ssgh"
    end
  end

  test do
    system "#{bin}/ssgh", "--version"
  end
end
