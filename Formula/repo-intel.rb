class RepoIntel < Formula
  desc "Contributor-stats dashboard generator for any git repo"
  homepage "https://github.com/tyom/repo-intel"
  url "https://github.com/tyom/repo-intel/releases/download/v1.3.0/repo-intel"
  version "1.3.0"
  sha256 "2165ea7516642118f8fe4c25c2514e29efd68eb8733648f20eb1ddc8605baa5a"
  license "MIT"

  # No python dependency: the script is stdlib-only and runs on any
  # python3 >= 3.9, including the one macOS ships with the CLT.
  def install
    bin.install "repo-intel"
  end

  test do
    assert_match "repo-intel", shell_output("#{bin}/repo-intel --help")
  end
end
