class Ssgh < Formula
  desc "Deliver stars on your behalf"
  homepage "https://github.com/417-72KI/SSGH"
  version "1.1.1"

  on_macos do
    url "https://github.com/417-72KI/SSGH/archive/#{version}.tar.gz"
    sha256 "6ca4ab104a843a7424db057524446e7d69519de6088aba7bb97c9b10d2de4d86"
    depends_on :xcode => ["13.2", :build]
  end
  on_linux do
    url "https://github.com/417-72KI/SSGH/releases/download/#{version}/ssgh-linux-v#{version}.zip"
    sha256 "c5a25996c49289b9f5d4322c96afe4b945909bb0728638ad09bc7e64893aa4d9"
  end
  license "MIT"
  head "https://github.com/417-72KI/SSGH.git", branch: "main"


  def install
    if OS.mac?
      system 'swift', 'build', '--disable-sandbox', '-c', 'release', '-Xswiftc', '-suppress-warnings'
      bin.install '.build/release/ssgh'
    elsif OS.linux?
      bin.install 'ssgh'
    end
  end

  test do
    system "#{bin}/ssgh", "--version"
  end
end
