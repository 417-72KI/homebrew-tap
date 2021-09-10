class Ssgh < Formula
	desc "Deliver stars on your behalf"
	homepage "https://github.com/417-72KI/SSGH"
	version "1.0.4"
	url "https://github.com/417-72KI/SSGH/releases/download/1.0.4/ssgh.zip"
	sha256 "eb28d1a9795219ae0835b4b166fa27eb3b226fadb3056052f9e6b863f539ba2e"

	def install
		bin.install 'ssgh'
	end

  test do
    system "false"
  end
end
