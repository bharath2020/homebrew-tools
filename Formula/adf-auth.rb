class AdfAuth < Formula
  desc "Sign in to Atlassian, keep API tokens in the keychain, and pair ADFReader by QR"
  homepage "https://github.com/bharath2020/connie-adf"
  url "https://github.com/bharath2020/connie-adf/archive/refs/tags/adf-auth-v0.1.0.tar.gz"
  sha256 "977bf1c50b6d74a37277dadf9153113654551e3cef976ac2a9c31c61f5da34fd"
  head "https://github.com/bharath2020/connie-adf.git", branch: "main"

  # Package.swift: swift-tools-version 6.0, platforms macOS 14.
  depends_on xcode: ["16.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "adf-auth"
    bin.install ".build/release/adf-auth"
  end

  test do
    assert_match "Usage: adf-auth <command> [options]", shell_output("#{bin}/adf-auth --help")
    assert_match "adf-auth", shell_output("#{bin}/adf-auth --version")
  end
end
