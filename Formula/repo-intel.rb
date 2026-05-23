class RepoIntel < Formula
  desc "Contributor-stats dashboard generator for any git repo"
  homepage "https://github.com/tyom/repo-intel"
  url "https://github.com/tyom/repo-intel/releases/download/v1.2.1/repo-intel"
  version "1.2.1"
  sha256 "cb8e227d63a21c55e4356f4b0e1b51ecf944aaec9c37a06ed41742608c054c05"
  license "MIT"

  depends_on "python@3.12"

  def install
    inreplace "repo-intel",
              %r{\A#!/usr/bin/env python3},
              "#!#{Formula["python@3.12"].opt_bin}/python3.12"
    bin.install "repo-intel"
  end

  test do
    assert_match "repo-intel", shell_output("#{bin}/repo-intel --help")
  end
end
