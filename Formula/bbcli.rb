class Bbcli < Formula
  desc "CLI for a Bytebase server, built to be driven by coding agents"
  homepage "https://github.com/xiispace/bbcli"
  version "2026.10.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/xiispace/bbcli/releases/download/v2026.10.12/bbcli-aarch64-apple-darwin.tar.gz"
      sha256 "573a06643319aff07b65c0a6335c1effa44b7f580ac15623bca4c8ed894924c2"
    end
    on_intel do
      url "https://github.com/xiispace/bbcli/releases/download/v2026.10.12/bbcli-x86_64-apple-darwin.tar.gz"
      sha256 "8694c0377d3489e93370319e9e8c4b0954f2c578d85721f3b15cc112ee189832"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xiispace/bbcli/releases/download/v2026.10.12/bbcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5fca6ef01b81608307255f8296906d8a697c11c5962934c0fb168dac48c60770"
    end
    on_intel do
      url "https://github.com/xiispace/bbcli/releases/download/v2026.10.12/bbcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f4221a18e5fd2f40fea44cf26c7163dd34224378d1245b96170571e2e3ac19f"
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
