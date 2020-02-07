class Ssgh < Formula
	desc "Deliver stars on your behalf"
	homepage "https://github.com/417-72KI/SSGH"
	version "1.0.1"
	url "https://github.com/417-72KI/SSGH/releases/download/1.0.1/ssgh.zip"
	sha256 "663c81c47b143a00b2a7cd86451017075d2192f3333b4dc8c9c9fa8bddadf108"

	def install
		bin.install 'ssgh'
	end

  test do
    system "false"
  end
end
