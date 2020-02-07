class Ssgh < Formula
	desc "Deliver stars on your behalf"
	homepage "https://github.com/417-72KI/SSGH"
	version "1.0.2"
	url "https://github.com/417-72KI/SSGH/releases/download/1.0.2/ssgh.zip"
	sha256 "93162c87f1aab2cc6289197698ad0125ce48aa7fc5aa4748872b5408de1b73b6"

	def install
		bin.install 'ssgh'
	end

  test do
    system "false"
  end
end
