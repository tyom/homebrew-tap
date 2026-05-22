class Kcm < Formula
  desc "Keychain Master - Secure secret management for macOS"
  homepage "https://github.com/tyom/kcm"
  url "https://github.com/tyom/kcm/releases/download/v0.5.0/kcm"
  version "0.5.0"
  sha256 "a7d1b53f5149190aedc5eb11054a6df925aa61211a0d5f3d3337185b21ae27ca"
  license "MIT"

  depends_on :macos
  depends_on "bash"

  def install
    inreplace "kcm",
              %r{\A#!/usr/bin/env bash},
              "#!#{Formula["bash"].opt_bin}/bash"
    bin.install "kcm"
  end

  test do
    assert_match "Keychain Master", shell_output("#{bin}/kcm help")
    assert_match(/kcm version \d+\.\d+\.\d+/, shell_output("#{bin}/kcm version"))
  end

  def caveats
    <<~EOS
      kcm has been installed! Here's how to get started:

      1. Add a secret to your Keychain:
         kcm add DATABASE_URL "your-connection-string"

      2. Add the reference to your .env file:
         DATABASE_URL="keychain://DATABASE_URL"

      3. Run your application with resolved secrets:
         kcm use -- npm run dev

      For more information:
         kcm help
    EOS
  end
end
