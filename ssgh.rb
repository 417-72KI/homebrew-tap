class Ssgh < Formula
  desc "Deliver stars on your behalf"
  homepage "https://github.com/417-72KI/SSGH"
  version "1.1.1"
  license "MIT"
  head "https://github.com/417-72KI/SSGH.git", branch: "main"

  on_macos do
      url "https://github.com/417-72KI/SSGH/releases/download/1.1.1/ssgh-macos-v1.1.1.zip"
      sha256 "582b1e14c0a80c12d89078b104d9e59a3d62bccc288340df1ad3e7b571844376"
  end
  on_linux do
      url "https://github.com/417-72KI/SSGH/releases/download/1.1.1/ssgh-linux-v1.1.1.zip"
      sha256 "c5a25996c49289b9f5d4322c96afe4b945909bb0728638ad09bc7e64893aa4d9"
  end

  def install
      bin.install 'ssgh'
  end

  test do
    system "false"
  end
end
