# mosse CLI(MD-518):单文件二进制来自公开 tap release;npm 版见 @mosse-ai/cli。
class Mosse < Formula
  desc "Mosse CLI — board, chat and knowledge from the terminal"
  homepage "https://github.com/Weavon-AI/mosse"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Weavon-AI/homebrew-tap/releases/download/v#{version}/mosse-darwin-arm64.tar.gz"
      sha256 "a02bea52263f08d6fcff6274afff413d84ef3ee736ec45e165135112f72e31d7"
    else
      url "https://github.com/Weavon-AI/homebrew-tap/releases/download/v#{version}/mosse-darwin-x64.tar.gz"
      sha256 "c6c24130f69bac28340eae1b04247cb86d71d63fcf80c1b0032d1935b2405047"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "mosse-darwin-arm64" => "mosse"
    else
      bin.install "mosse-darwin-x64" => "mosse"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mosse --version")
  end
end
