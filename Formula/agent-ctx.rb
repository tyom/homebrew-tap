class AgentCtx < Formula
  desc "Show what a coding agent loads when it opens a repo, and where it comes from"
  homepage "https://github.com/tyom/agent-ctx"
  url "https://github.com/tyom/agent-ctx/releases/download/v0.2.0/agent-ctx"
  version "0.2.0"
  sha256 "67801672db2930d05f4026d174feab2a85a60ed7de6ea9e68a1ae27ce9e2bf1d"
  license "MIT"

  depends_on "bash"
  depends_on "jq"

  def install
    inreplace "agent-ctx",
              %r{\A#!/usr/bin/env bash},
              "#!#{Formula["bash"].opt_bin}/bash"
    bin.install "agent-ctx"
  end

  test do
    assert_match "usage: agent-ctx", shell_output("#{bin}/agent-ctx -h")
    # Without a harness directory to read there is nothing to report, and it says
    # so and exits 1, so the table needs one
    (testpath/"home/.claude").mkpath
    assert_match "claude", shell_output("HOME=#{testpath}/home #{bin}/agent-ctx")
  end
end
