class XcodeArch < Formula
  desc "Set `Open using Rosetta` option on Xcode easily for M1 mac"
  homepage "https://github.com/417-72KI/xcode-arch"
  version "0.0.2"

  url "https://github.com/417-72KI/xcode-arch/archive/#{version}.tar.gz"
  sha256 "bcfb2e2d949a54fe8f95e73115a332a505ac99c86361201ae3d4b84acc954a13"

  license "MIT"
  head "https://github.com/417-72KI/xcode-arch.git", branch: "main"

  depends_on xcode: ["13.3", :build]
  depends_on arch: :arm64
  depends_on :macos
  depends_on macos: :monterey

  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/xcode-arch"
  end

  test do
    current_xcode = shell_output("xcode-select -p").chomp.delete_suffix("/Contents/Developer")
    regex = /^`#{current_xcode}` is running with (x86_64|arm64)$/
    message = shell_output("#{bin}/xcode-arch -p").chomp[7...-5]
    assert_match regex, message
    case message.match(regex).captures[0]
    when "arm64"
      system "#{bin}/xcode-arch", "-c"
      system "#{bin}/xcode-arch", "-u"
    when "x86_64"
      system "#{bin}/xcode-arch", "-u"
      system "#{bin}/xcode-arch", "-c"
    else
      raise "Unexpected architecture."
    end

    assert_match version.to_s, shell_output("#{bin}/xcode-arch --version").chomp
  end
end
