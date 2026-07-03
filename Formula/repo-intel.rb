class RepoIntel < Formula
  desc "Contributor-stats dashboard generator for any git repo"
  homepage "https://github.com/tyom/repo-intel"
  url "https://github.com/tyom/repo-intel/releases/download/v1.2.3/repo-intel"
  version "1.2.3"
  sha256 "ada0a3cf15ea1c20a86005869b79b56b280acc51e154f29e730250ebb57c3086"
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
