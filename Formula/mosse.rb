# mosse CLI(MD-518):单文件二进制来自 mosse 仓库的 cli-v* Release;npm 版见 @mosse-ai/cli。
class Mosse < Formula
  desc "Mosse CLI — board, chat and knowledge from the terminal"
  homepage "https://github.com/Weavon-AI/mosse"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Weavon-AI/homebrew-tap/releases/download/v#{version}/mosse-darwin-arm64.tar.gz"
      sha256 "db7d2d7b4929bb009689bc147531a848e717b8ebdace6eba612d99333ca519a0"
    else
      url "https://github.com/Weavon-AI/homebrew-tap/releases/download/v#{version}/mosse-darwin-x64.tar.gz"
      sha256 "36dff556b3d22cb71f6d04ea94b583a08defb670cb51c775b4c7923baf7beebb"
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
