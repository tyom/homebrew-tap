class Ungit < Formula
  desc "Download a repo, directory, or file from GitHub (or emit it as LLM prompt text)"
  homepage "https://github.com/tyom/ungit"
  url "https://github.com/tyom/ungit/releases/download/v0.1.0/ungit"
  version "0.1.0"
  sha256 "e215f5df5329557527c04aa3253e4d0fc0864e31fe48fecabfb816012f06901a"
  license "MIT"

  depends_on :macos
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
