# Formula template for the companion. bin/release-agent fills the three
# placeholders and commits the result into the tap repository — do not edit the
# copy that ends up in the tap, edit this one and re-release.
#
# The companion is plain ESM with no dependencies, so there is nothing to build:
# the whole package goes into libexec and the executable is symlinked onto the
# PATH. Node resolves a symlinked entry point against its real path, so
# `../src/*.js` still lands inside libexec.
class CmaAgent < Formula
  desc "Run Configure My AI work on your own machine with your own Claude Code login"
  homepage "https://configuremyai.com"
  url "https://github.com/9thdesigns/cma-agent/archive/refs/tags/v0.16.0.tar.gz"
  sha256 "3c3d0614aa991240224dffed89c474311d30909d7afd8a9903ac3515e0fe2249"
  version "0.16.0"
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

      To work against repositories already on this Mac, share a folder — until
      you do, none are visible to the web app:

        cma-agent repos:add ~/code

      That uses the `git` you already have (Xcode Command Line Tools, or
      `brew install git`), with the credentials it is already configured with.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cma-agent --version")
  end
end
