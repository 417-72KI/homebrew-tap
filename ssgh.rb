class Ssgh < Formula
	desc "Deliver stars on your behalf"
	homepage "https://github.com/417-72KI/SSGH"
	version "1.0.0"
	url "https://github.com/417-72KI/SSGH/releases/download/1.0.0/ssgh.zip"
	sha256 "9e1e73fa71004fe4ec4c4f6b711af2c6e2f38d777a44f2268c326eb98881f77e"

	def install
		bin.install 'ssgh'
	end

	test do
    system "false"
  end
end
