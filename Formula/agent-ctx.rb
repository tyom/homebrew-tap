class AgentCtx < Formula
  desc "Show what a coding agent loads when it opens a repo, and where it comes from"
  homepage "https://github.com/tyom/agent-ctx"
  url "https://github.com/tyom/agent-ctx/releases/download/v0.1.1/agent-ctx"
  version "0.1.1"
  sha256 "d4658a5ac9cafdbc5664817a62b779b8e247c0eec24dd8a7a8bee436c92cb8c8"
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
