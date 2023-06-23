class Ssgh < Formula
  desc "Deliver stars on your behalf"
  homepage "https://github.com/417-72KI/SSGH"
  version "1.3.0"

  on_macos do
    url "https://github.com/417-72KI/SSGH/archive/#{version}.tar.gz"
    sha256 "6b981e96ac2cdbb96d4f977b971c576b7d715847b02fef2b0ac6ed15b15efe0b"
    depends_on :xcode => ["13.3", :build]
  end
  on_linux do
    url "https://github.com/417-72KI/SSGH/releases/download/#{version}/ssgh-linux-v#{version}.zip"
    sha256 "b47f3fbfd57909c7a93cc4ccd7538f85f240e15cbe23a7df1cee1bccd59e5536"
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
