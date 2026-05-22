class RepoIntel < Formula
  desc "Contributor-stats dashboard generator for any git repo"
  homepage "https://github.com/tyom/repo-intel"
  url "https://github.com/tyom/repo-intel/releases/download/v1.1.0/repo-intel"
  version "1.1.0"
  sha256 "599cec8bfad35b97f7ef3856f7ca0536ea4fce062caa5f245f0587d5d55904f2"
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
