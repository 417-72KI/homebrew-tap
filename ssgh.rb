class Ssgh < Formula
  desc "Deliver stars on your behalf"
  homepage "https://github.com/417-72KI/SSGH"
  version "1.1.0"
  license "MIT"
  head "https://github.com/417-72KI/SSGH.git", branch: "main"

  on_macos do
      url "https://github.com/417-72KI/SSGH/releases/download/1.1.0/ssgh-macos-v1.1.0.zip"
      sha256 "a95db7a9b1a9df3d861e51801ae486009711067c5d7d18812482962256ec7990"
  end
  on_linux do
      url "https://github.com/417-72KI/SSGH/releases/download/1.1.0/ssgh-linux-v1.1.0.zip"
      sha256 "45cef2890d1ac5676725cd281039d3149fbd4c5ab88ca0b8fb604b2fdd12e595"
  end

  def install
      bin.install 'ssgh'
  end

  test do
    system "false"
  end
end
