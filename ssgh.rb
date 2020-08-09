class Ssgh < Formula
	desc "Deliver stars on your behalf"
	homepage "https://github.com/417-72KI/SSGH"
	version "1.0.3"
	url "https://github.com/417-72KI/SSGH/releases/download/1.0.3/ssgh.zip"
	sha256 "42a1294cc6deb1102c9dc0f69703713a86cfb3101e1c482ee9df3875bf953311"

	def install
		bin.install 'ssgh'
	end

  test do
    system "false"
  end
end
