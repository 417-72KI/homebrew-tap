class Ssgh < Formula
  desc "Deliver stars on your behalf"
  homepage "https://github.com/417-72KI/SSGH"
  version "1.4.0"

  on_macos do
    url "https://github.com/417-72KI/SSGH/archive/#{version}.tar.gz"
    sha256 "741eac3b9793630c5398a5adcdd87d016de8a698f8463b8ff074f5a5f0b4cc37"
    depends_on :xcode => ["14.0", :build]
  end
  on_linux do
    url "https://github.com/417-72KI/SSGH/releases/download/#{version}/ssgh-linux-v#{version}.zip"
    sha256 "de7d60e28b4815dd7da69923c44746356b4c613d0a80f8288276842abd120293"
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
