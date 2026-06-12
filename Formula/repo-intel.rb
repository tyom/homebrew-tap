class RepoIntel < Formula
  desc "Contributor-stats dashboard generator for any git repo"
  homepage "https://github.com/tyom/repo-intel"
  url "https://github.com/tyom/repo-intel/releases/download/v1.2.2/repo-intel"
  version "1.2.2"
  sha256 "5c2dc41ef5ed3b7171be28fb036b0a967be3560fa74b9eb0460dbc8e2756eb25"
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
