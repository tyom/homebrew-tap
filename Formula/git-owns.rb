class GitOwns < Formula
  desc "Line ownership per directory, top contributors first"
  homepage "https://github.com/tyom/git-owns"
  url "https://github.com/tyom/git-owns/releases/download/v0.2.0/git-owns"
  version "0.2.0"
  sha256 "b1c6ca1c00784c9cd82ffd34e24c4cc0b59dabdbfcdb413abcb45dd0457807ff"
  license "MIT"

  def install
    bin.install "git-owns"
  end

  test do
    assert_match "Usage: git owns", shell_output("#{bin}/git-owns -h")

    # A tree to blame, since without a commit there is nothing to own
    system "git", "-C", testpath, "init", "-q"
    (testpath/"a.txt").write("one\ntwo\n")
    system "git", "-C", testpath, "add", "a.txt"
    system "git", "-C", testpath, "-c", "user.name=Ada Lovelace",
           "-c", "user.email=ada@example.com", "commit", "-qm", "a"
    assert_match "Ada L.", shell_output("cd #{testpath} && #{bin}/git-owns")
  end
end
