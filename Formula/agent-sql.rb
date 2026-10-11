class AgentSql < Formula
  desc "Read-only SQL CLI for AI agents"
  homepage "https://github.com/xiispace/agent-sql"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/xiispace/agent-sql/releases/download/v1.20.0/agent-sql-darwin-arm64.tar.gz"
      sha256 "6d6322cc12114dfc52a48c7a779f7d23fc812657a7ad274f12ff361c461611cd"
    end
    on_intel do
      url "https://github.com/xiispace/agent-sql/releases/download/v1.20.0/agent-sql-darwin-amd64.tar.gz"
      sha256 "149bda7b594d0c4124bb3f7cb6fcb85b96cf16628a26e5ee14cb6aff681d7fb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xiispace/agent-sql/releases/download/v1.20.0/agent-sql-linux-arm64.tar.gz"
      sha256 "7306b791b32dab7fd688639b876f10f670ed0f5a87077a09fa0b8d2de187527d"
    end
    on_intel do
      url "https://github.com/xiispace/agent-sql/releases/download/v1.20.0/agent-sql-linux-amd64.tar.gz"
      sha256 "57d15af59341a1b9f6e6205f41883f3ea39c85213170d7e6d3e12fa3f5e511b2"
    end
  end

  def install
    bin.install "agent-sql"
    # Installs shell completions via `agent-sql completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-sql", "completion")
  end

  test do
    assert_match "1.20.0", shell_output("#{bin}/agent-sql --version")
    assert_match "Read-only-by-default SQL CLI", shell_output("#{bin}/agent-sql --help")
    assert_match "#compdef agent-sql", shell_output("#{bin}/agent-sql completion zsh")
  end
end
