class CmaAgent < Formula
  desc "Run Configure My AI work on your own machine with your own Claude Code login"
  homepage "https://configuremyai.com"
  url "https://github.com/9thdesigns/cma-agent/archive/9d96422ee0046ae13067523c5c41f0b22cb4d08f.tar.gz"
  sha256 "a4c6fd5a116649aed3878e93ca1fea6b5a49845e2e0bcc515295261eebdfdbab"
  version "0.1.0"
  license :cannot_represent

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cma-agent.js" => "cma-agent"
  end

  def caveats
    <<~EOS
      cma-agent runs the Claude Code you have installed and signed into, so you
      also need:

        Claude Code    https://claude.com/product/claude-code

      Then pair this machine:

        cma-agent pair

      The pairing code comes from Devices in Configure My AI. Your Claude login
      is never sent anywhere — Claude Code reads it from your keychain locally.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cma-agent --version")
  end
end
