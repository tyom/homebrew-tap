class Ungit < Formula
  desc "Download a repo, directory, or file from GitHub (or emit it as LLM prompt text)"
  homepage "https://github.com/tyom/ungit"
  url "https://github.com/tyom/ungit/releases/download/v0.2.0/ungit"
  version "0.2.0"
  sha256 "179f1e56afc7b7350a81127e3c3c7e12538f23badd2c2e82f861b15a10bd33f4"
  license "MIT"

  depends_on "bash"

  def install
    inreplace "ungit",
              %r{\A#!/usr/bin/env bash},
              "#!#{Formula["bash"].opt_bin}/bash"
    bin.install "ungit"
  end

  test do
    assert_match(/ungit version \d+\.\d+\.\d+/, shell_output("#{bin}/ungit --version"))
    assert_match "Download a repository", shell_output("#{bin}/ungit --help")
  end
end
