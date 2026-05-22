class RepoIntel < Formula
  desc "Contributor-stats dashboard generator for any git repo"
  homepage "https://github.com/tyom/repo-intel"
  url "https://github.com/tyom/repo-intel/releases/download/v1.0.0/repo-intel"
  version "1.0.0"
  sha256 "41f14c4b91ba4e64cc7a8de2b9ddb0e2d36767478df0c57b36d9ceb7e0801794"
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
