class Bbcli < Formula
  desc "CLI for a Bytebase server, built to be driven by coding agents"
  homepage "https://github.com/xiispace/bbcli"
  version "2026.11.24"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/xiispace/bbcli/releases/download/v2026.11.24/bbcli-aarch64-apple-darwin.tar.gz"
      sha256 "85ba87fbabb72c54b51cc39065d8ceea4c4b51faf5b512ee801dddee0232d475"
    end
    on_intel do
      url "https://github.com/xiispace/bbcli/releases/download/v2026.11.24/bbcli-x86_64-apple-darwin.tar.gz"
      sha256 "268eb60d8487a7b5a5e961e27a2445e32aecb120ea6bf3eec572a1eaf5329655"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xiispace/bbcli/releases/download/v2026.11.24/bbcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60b47853e01f2619b1b52d5bf70b5a079bc5c532680098352ec5112e92a5f161"
    end
    on_intel do
      url "https://github.com/xiispace/bbcli/releases/download/v2026.11.24/bbcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "996c704adc8998c25b8a042c0fe95163368d704bd74c7528636c7fe192717368"
    end
  end

  def install
    bin.install "bbcli"
    # The binary embeds vendor/bytebase/ (MIT Expat); keep its notice
    # alongside, as the release archives do.
    pkgshare.install "vendor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bbcli --version")
    assert_match "Bytebase", shell_output("#{bin}/bbcli --help")
  end
end
